# RailsLinkPreview

RailsLinkPreview is a Ruby gem designed for Ruby on Rails applications to easily generate link previews from URLs. It leverages the power of Nokogiri for HTML parsing and provides a simple interface to extract metadata such as title, site name, description, media type, images, videos, favicons, and more from a given URL.

## Features

- **Simple Integration:** Easily integrate link previews into your Ruby on Rails applications.
- **Customizable:** Extract various metadata from URLs and customize the display of link previews.
- **Dependency:** Relies on the Nokogiri gem for HTML parsing.

## Installation

Add the gem to your Gemfile:

```ruby
gem 'rails_link_preview', '~> 0.0.0'
```

Then run:

```bash
bundle install
```

## Usage

```ruby
# In your Ruby on Rails application
link_preview = RailsLinkPreview::Generator.generate("https://example.com")

# Use link_preview hash in your application
puts "URL: #{link_preview[:url]}"
puts "Title: #{link_preview[:title]}"
puts "Site Name: #{link_preview[:siteName]}"
puts "Description: #{link_preview[:description]}"
puts "Media Type: #{link_preview[:mediaType]}"
puts "Content Type: #{link_preview[:contentType]}"
puts "Images: #{link_preview[:images].join(', ')}"
puts "Videos: #{link_preview[:videos].join(', ')}"
puts "Favicons: #{link_preview[:favicons].join(', ')}"
puts "Charset: #{link_preview[:charset]}"
```

## Dependencies

- [Nokogiri](https://nokogiri.org/) (~> 1.15)
- [Open URI](https://ruby-doc.org/stdlib-2.7.1/libdoc/open-uri/rdoc/OpenURI.html) (~> 0.4.0)


## License

This gem is available as open source under the terms of the [MIT License](LICENSE).