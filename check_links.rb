require 'nokogiri'
require 'pp'

def extract_version(url)
  url.match(/\/(\d+\.\d+)\//) { |m| m[1] }
end

def parse_api_list(file_path)
  api_list = {}
  current_api = nil

  File.readlines(file_path).each do |line|
    if line.start_with?('- API:')
      api_name = line.match(/- API: \[(.+)\]\(.*\)/).captures.first
      match = line.match(/\(Sandbox: (\d+\.\d+), Production: (?:(\d+\.\d+)|N\/A)\)/)
      if match
        sandbox_version = match.captures[0]
        production_version = match.captures[1] || 'N/A'
        current_api = api_name
        api_list[current_api] = {
          sandbox: sandbox_version,
          production: production_version,
          endpoints: []
        }
      end
    elsif line.start_with?('  - Endpoint:')
      endpoint_name = line.match(/- Endpoint: (.+)/).captures.first
      api_list[current_api][:endpoints] << endpoint_name if current_api
    end
  end

  api_list
end

def check_markdown_links(api_list, file_path)
  markdown = File.read(file_path)
  warnings = []

  markdown.scan(/\[.*?\]\(.*?\)/).each do |link|
    link_text = link.match(/\[(.*?)\]/)[1].gsub(/[^\w\s]/, '').squeeze(' ').downcase
    href = link.match(/\((.*?)\)/)[1]
    link_version = href.match(/\/(\d+\.\d+)\//)&.captures&.first

    api_list.each do |api_name, versions|
      api_endpoints = versions[:endpoints]
      api_endpoints&.each do |endpoint|
        sanitized_endpoint = endpoint.gsub(/[^\w\s]/, '').squeeze(' ').downcase
        if link_text == sanitized_endpoint
          if link_version.nil?
            next
          elsif versions[:production] == 'N/A'
            warnings << [href, api_name, endpoint, link_version, versions[:sandbox], versions[:production], 'no prod version']
          elsif link_version < versions[:production]
            warnings << [href, api_name, endpoint, link_version, versions[:sandbox], versions[:production], 'stale (newer prod version available)']
          elsif link_version == versions[:sandbox] && link_version > versions[:production]
            warnings << [href, api_name, endpoint, link_version, versions[:sandbox], versions[:production], 'links to sandbox version when prod is lower']
          elsif link_version > versions[:sandbox]
            warnings << [href, api_name, endpoint, link_version, versions[:sandbox], versions[:production], 'links to version that is not public (broken?)']
          elsif link_version != versions[:production]
            warnings << [href, api_name, endpoint, link_version, versions[:sandbox], versions[:production], 'other']
          end
        end
      end
    end
  end

  if warnings.any?
    puts "Warnings:"
    warnings.each do |warning|
      puts "----"
      puts "URL: #{warning[0]}"
      puts "API name: #{warning[1]}"
      puts "Endpoint: #{warning[2]}"
      puts "Markdown version: #{warning[3]}"
      puts "Sandbox version: #{warning[4]}"
      puts "Production version: #{warning[5]}"
      puts "Problem: #{warning[6]}"
    end
  end
end


# Get the file paths from command-line arguments
api_list_file = 'api-list.md'
markdown_directory = 'source/documentation'

# Parse the API list
api_list = parse_api_list(api_list_file)

# Output the api_list hash in a human-readable format
puts "Parsing API List..."
# pp api_list

# Check each Markdown file in the directory for mismatched version numbers in links
Dir.glob("#{markdown_directory}/**/*").each do |file_path|

  next if File.directory?(file_path) || File.extname(file_path) != '.md' || File.basename(file_path).start_with?('_')
  puts "------"
  puts "Checking file: #{file_path}"
  check_markdown_links(api_list, file_path)
end