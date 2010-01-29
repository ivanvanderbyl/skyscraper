module Skyscraper
  module DSL
    class ScraperMethods < Base
      
      attr_accessor :page_urls
      
      def initialize(parent)
        self.page_urls = []
        return true
      end
      
      def page(url)
        self.page_urls << url
      end
      
      
      
    end
  end
end