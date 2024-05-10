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
      api_name, version = line.match(/- API: \[(.+)\]\(.*\/(\d+\.\d+)\)/).captures
      current_api = [api_name, version]
      api_list[current_api] = []
    elsif line.start_with?('  - Endpoint:')
      endpoint_name = line.match(/- Endpoint: (.+)/).captures.first
      api_list[current_api] << endpoint_name
    end
  end

  api_list
end

def check_markdown_links(api_list, file_path)
  markdown = File.read(file_path)

  markdown.scan(/\[.*?\]\(.*?\)/).each do |link|
    link_text = link.match(/\[(.*?)\]/)[1].gsub(/[^\w\s]/, '').squeeze(' ').downcase
    href = link.match(/\((.*?)\)/)[1]

    api_list.each do |api_info, endpoints|
      api_name, api_version = api_info

      endpoints.each do |endpoint_name|
        sanitized_endpoint_name = endpoint_name.gsub(/[^\w\s]/, '').squeeze(' ').downcase
        if link_text == sanitized_endpoint_name
          link_version = extract_version(href)

          if link_version && link_version != api_version
            puts "Warning: Endpoint '#{endpoint_name}' in the Markdown file '#{File.basename(file_path)}' has version #{link_version}, " \
                 "but it belongs to #{api_name} in the API list."
          end
        end
      end
    end
  end
end

# Get the file paths from command-line arguments
api_list_file = 'api-list.md'
markdown_directory = 'documentation'

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