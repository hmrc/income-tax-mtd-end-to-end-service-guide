require 'nokogiri'
require 'open-uri'
require 'yaml'

# Fetch the HTML content from the URL
url = 'https://developer.service.hmrc.gov.uk/api-documentation/docs/api?filter=income-tax-mtd'
doc = Nokogiri::HTML(URI.open(url))

# Find all the hyperlinks where the anchor text ends with "(MTD)"
links = doc.css('a[href]').select { |link| link.text.strip.end_with?('(MTD)') }

# Process each link
links.each do |link|
  # Fetch the HTML content of the page at the URL
  link_url = URI.join('https://developer.service.hmrc.gov.uk', link['href']).to_s
  link_doc = Nokogiri::HTML(URI.open(link_url))

  # Find the anchor element with the content "View API endpoints"
  api_endpoints_link = link_doc.at('a:contains("View API endpoints")')

  # Extract the URL of the anchor element
  if api_endpoints_link
    api_endpoints_url = URI.join('https://developer.service.hmrc.gov.uk', api_endpoints_link['href']).to_s
    resolved_url = api_endpoints_url.gsub('/page', '/resolved')

    # Extract the version number from the link_url
    version_number = link_url.split('/').last

    begin
      # Fetch the YAML content from the resolved URL
      yaml_content = URI.open(resolved_url).read
      yaml_data = YAML.safe_load(yaml_content, permitted_classes: [Date, Time])

      # Extract and print the "summary" elements from the YAML
      puts "- API: [#{link.text.strip} #{version_number}](#{link_url})"
      yaml_data['paths'].each do |path, methods|
        methods.each do |method, details|
          puts "  - Endpoint: #{details['summary']}"
        end
      end
      puts ""
    rescue OpenURI::HTTPError => e
      puts "Error fetching YAML content for #{resolved_url}: #{e.message}"
    rescue Psych::SyntaxError => e
      puts "Error parsing YAML content for #{resolved_url}: #{e.message}"
    end
  else
    puts "No 'View API endpoints' link found for #{link_url}"
  end
end