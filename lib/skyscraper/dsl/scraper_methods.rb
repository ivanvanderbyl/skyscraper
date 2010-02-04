module Skyscraper
  module DSL
    class ScraperMethods
      
      attr_accessor :page_urls
      
      def initialize
        self.page_urls = []
        return true
      end
      
      def page(url)
        puts 'Added page: ' + url
        self.page_urls << url
      end
            
      
    end
  end
end