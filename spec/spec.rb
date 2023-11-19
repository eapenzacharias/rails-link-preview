# spec/rails_link_preview_spec.rb

require 'rails_link_preview'
require 'webmock/rspec'

RSpec.describe RailsLinkPreview::Generator do
  describe '.generate' do
    let(:url) { 'https://example.com' }

    before do
      # Stub the HTTP request to simulate fetching a web page
      stub_request(:get, url).to_return(body: File.open('spec/fixtures/example_page.html'))
    end

    it 'generates link preview data' do
      link_preview = described_class.generate(url)

      expect(link_preview[:url]).to eq(url)
      expect(link_preview[:title]).to eq('Example Domain')
      expect(link_preview[:siteName]).to eq('Example Domain')
      expect(link_preview[:description]).to eq('This domain is for use in illustrative examples in documents.')
      expect(link_preview[:mediaType]).to eq('website')
      expect(link_preview[:contentType]).to eq('text/html')
      expect(link_preview[:images]).to eq(['https://www.example.com/images/logo.png'])
      expect(link_preview[:videos]).to eq(['https://www.example.com/videos/intro.mp4'])
      expect(link_preview[:favicons]).to eq(['/favicon.ico'])
      expect(link_preview[:charset]).to eq('utf-8')
    end
  end
end
