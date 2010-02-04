module Skyscraper
  module DSL
    module Main
      
      def scraper(&block)
        ScraperMethods.new.instance_eval(&block)
      end
      
    end
  end
end

include Skyscraper::DSL::Main