module Skyscraper
  module DSL
    class ParserMethods < Base
      
      def scraper(&block)
        ScraperMethods.new(reader).instance_eval(&block)
      end
      
    end
  end
end