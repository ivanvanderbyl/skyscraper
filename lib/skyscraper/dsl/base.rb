module Skyscraper
  module DSL
    class Base
      
      attr_accessor :reader
      
      def initialize(reader)
        self.reader = reader
      end

    end
  end
end