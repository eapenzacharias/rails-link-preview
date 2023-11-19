require 'open-uri'
require 'nokogiri'

module RailsLinkPreview
  class Generator
    META_TAGS = {
      site_name: 'meta[property="og:site_name"]',
      description: 'meta[name="description"]',
      media_type: 'meta[property="og:type"]',
      image: 'meta[property="og:image"]',
      video: 'meta[property="og:video"]',
      favicon: 'link[rel="icon"]'
    }.freeze

    class << self
      def generate(url)
        doc = fetch_document(url)
        metadata = extract_metadata(doc)

        {
          url: url,
          title: doc.css('title').text,
          siteName: metadata[:site_name].first,
          description: metadata[:description].first,
          mediaType: metadata[:media_type].first,
          contentType: 'text/html',
          images: metadata[:image],
          videos: metadata[:video],
          favicons: metadata[:favicon],
          charset: doc.encoding.to_s.downcase
        }
      end

      private

      def fetch_document(url)
        Nokogiri::HTML(URI.open(url))
      end

      def extract_metadata(doc)
        META_TAGS.transform_values { |tag| fetch_data(doc, tag) }
      end

      def fetch_data(doc, tag)
        return doc.css(tag).map { |e| e.attr('content') } if tag.start_with?('meta')
        doc.css(tag).map { |e| e.attr('href') }
      end
    end
  end
end
