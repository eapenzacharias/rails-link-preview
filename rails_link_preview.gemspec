# rails_link_preview.gemspec

Gem::Specification.new do |spec|
  spec.name          = "rails_link_preview"
  spec.version       = "0.0.0"
  spec.authors       = ["Eapen Zacharias"]
  spec.email         = ["eapen@wavbee.com"]
  spec.summary       = %q{A gem for generating link previews}
  spec.description   = %q{A gem for generating link previews in Ruby on Rails applications}
  spec.homepage      = "https://github.com/eapenzacharias/rails-link-preview/"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*"] + ["rails_link_preview.gemspec"]
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.15"
  spec.add_dependency "open-uri", "~> 0.4.0"
end
