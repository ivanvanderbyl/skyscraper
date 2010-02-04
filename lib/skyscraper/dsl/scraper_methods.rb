module Skyscraper
  module DSL
    class ScraperMethods
      
      attr_accessor :parent, :page_urls, :doc, :record
      
      def initialize(parent)
        self.page_urls = []
        self.parent = parent
        return true
      end
      
      def page(url)
        self.page_urls << url
      end
      
      def context(mod, &block)
        self.record = mod.new
        
        yield if block_given?
      end
      
      def css(selector)
        doc.css(selector).each do |doc|
          
        end
      end
      
      def run!
        self.page_urls.each do |url|
          load_page(url)
        end
      end
      
      private
      
      def load_page(url)
        self.doc = Nokogiri::HTML(open(url))
      end
      
    end
  end
end