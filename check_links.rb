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
            puts "Warning: URL '#{href}' in the Markdown file '#{File.basename(file_path)}' has version #{link_version}, " \
                 "but the Production version for the API '#{api_name}' is not available (N/A) in the API list."
          elsif link_version < versions[:production]
            puts "Warning: URL '#{href}' in the Markdown file '#{File.basename(file_path)}' has version #{link_version}, " \
                 "which is lower than the Production version #{versions[:production]} for the API '#{api_name}' in the API list. " \
                 "The link is stale and should be updated."
          elsif link_version == versions[:sandbox] && link_version > versions[:production]
            puts "Warning: URL '#{href}' in the Markdown file '#{File.basename(file_path)}' has version #{link_version}, " \
                 "which matches the Sandbox version but is higher than the Production version #{versions[:production]} for the API '#{api_name}' in the API list."
          elsif link_version != versions[:production]
            puts "Warning: URL '#{href}' in the Markdown file '#{File.basename(file_path)}' has version #{link_version}, " \
                 "but it should match the Production version #{versions[:production]} for the API '#{api_name}' in the API list."
          end
        end
      end
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
pp api_list

# Check each Markdown file in the directory for mismatched version numbers in links
Dir.glob("#{markdown_directory}/**/*").each do |file_path|
  next if File.directory?(file_path) || File.extname(file_path) != '.md'
  
  puts "------"
  puts "Checking file: #{file_path}"
  check_markdown_links(api_list, file_path)
end