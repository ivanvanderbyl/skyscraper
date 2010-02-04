require File.join(File.dirname(__FILE__), 'dsl', 'main')
require File.join(File.dirname(__FILE__), 'dsl', 'scraper_methods')

module Skyscraper
  
  # Signals errors that occur while reading and parsing an authorization DSL
  class DSLError < Exception; end
  # Signals errors in the syntax of an authorization DSL.
  class DSLSyntaxError < DSLError; end
  
  class Base
    
    attr_accessor :dsl_instance
    def initialize
      self.dsl_instance = false
    end
    
    def parse(dsl_data, file_name = nil)
      # self.dsl_instance = DSL::ParserMethods.new(self)
      
      if file_name
        # self.dsl_instance.
        instance_eval(dsl_data, file_name)
      else
        # self.dsl_instance.
        instance_eval(dsl_data)
      end
    rescue SyntaxError, NoMethodError, NameError => e
      raise DSLSyntaxError, "Illegal DSL syntax: #{e}"
    end
    
    class << self
      # Loads and parses a DSL from the given file name.
      def load(*dsl_files)
        reader = new
        dsl_files.flatten!
        dsl_files.each do |file|
          reader.parse(File.read(file), file) if File.exist?(file)
        end
        reader
      end
    end
  end
end