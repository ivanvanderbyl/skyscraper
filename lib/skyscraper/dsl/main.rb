module Skyscraper
  module DSL
    module Main
      
      def scraper(&block)
        klass = ScraperMethods.new
        klass.instance_eval(&block)
        klass.run!
      end
      
    end
  end
end

include Skyscraper::DSL::Main