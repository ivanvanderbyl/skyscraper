require File.join(File.dirname(__FILE__), 'dsl', 'base')
require File.join(File.dirname(__FILE__), 'dsl', 'scraper_methods')
require File.join(File.dirname(__FILE__), 'dsl', 'parser_methods')

module Skyscraper
  
  # Signals errors that occur while reading and parsing an authorization DSL
  class DSLError < Exception; end
  # Signals errors in the syntax of an authorization DSL.
  class DSLSyntaxError < DSLError; end
  
  class Base
    
    attr_accessor :dsl
    def initialize
      self.dsl = false
    end
    
    def parse(dsl_data, file_name = nil)
      DSL::ParserMethods.new(self).instance_eval(dsl_data, file_name)
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