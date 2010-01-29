module Skyscraper
  module DSL
    class Base
      
      attr_accessor :reader
      
      def initialize(reader)
        self.reader = reader
      end
      
      def scraper(&block)
        yield if block_given?
      end
      
    end
  end
end