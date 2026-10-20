puts "Warning: this script may generate false positive warnings when an endpoint name exists in multiple APIs."
puts "Always manually validate before updating the version number in a link."
puts ""

def extract_version(url)
  match = url.match(/\/(\d+\.\d+)\//)
  match ? match[1] : nil
end

def parse_api_list(file_path)
  api_list = {}
  current_slug = nil

  File.readlines(file_path).each do |line|
    if line.start_with?('API:')
      match = line.match(/API: \[(.+)\]\((.*)\)/)
      next unless match

      url = match[2]
      slug = url.split('/').find { |part| part.end_with?('-api') }
      current_slug = slug
      api_list[current_slug] = { name: match[1], url: url }
    elsif line.start_with?('(Version ') && current_slug
      match = line.match(/\(Version ([\d.]+)\)/)
      api_list[current_slug][:version] = match[1] if match
    end
  end

  api_list
end

def check_markdown_links(api_list, file_path)
  markdown = File.read(file_path)
  warnings = []
  url_stem = 'https://developer.service.hmrc.gov.uk'

  markdown.scan(/\[.*?\]\((.*?)\)/).each do |match|
    href = match[0]
    next unless href.start_with?(url_stem)

    link_version = extract_version(href)
    next if link_version.nil?
    link_ver = link_version.to_f

    slug = href.split('/').find { |part| part.end_with?('-api') }
    next if slug.nil?

    api = api_list[slug]
    next if api.nil?

    current_version = api[:version]
    next if current_version.nil?
    current_ver = current_version.to_f

    if link_ver < current_ver
      warnings << [href, api[:name], link_version, current_version, 'stale (newer version available)']
    elsif link_ver > current_ver
      warnings << [href, api[:name], link_version, current_version, 'links to version not in API list']
    end
  end

  if warnings.any?
    puts "Warnings for file: #{file_path}"
    warnings.each do |w|
      puts "----"
      puts "URL: #{w[0]}"
      puts "API: #{w[1]}"
      puts "Link version: #{w[2]}"
      puts "Current version: #{w[3]}"
      puts "Problem: #{w[4]}"
    end
  else
    puts "No warnings for file: #{file_path}"
  end
end

api_list_file = 'api-list.md'
markdown_directory = 'source/documentation'

api_list = parse_api_list(api_list_file)

Dir.glob("#{markdown_directory}/**/*.md").each do |file_path|
  next if File.basename(file_path).start_with?('_')
  puts "------"
  puts "Checking file: #{file_path}"
  check_markdown_links(api_list, file_path)
end