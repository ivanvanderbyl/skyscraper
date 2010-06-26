require "rubygems"
require "nokogiri"
require 'open-uri'
require 'blockenspiel'

autoload :Scrapeable, File.join(File.dirname(__FILE__), 'scrapeable')
autoload :ORM, File.join(File.dirname(__FILE__), 'orm')

# Load all our models
Dir.glob(File.join("..", 'models', '*.rb')).each{ |model| require model}

class Block
  include Blockenspiel::DSL
end

module Scraper
  def css(scope)
    save_collection(@klass, @doc.css(scope))
  end
end

class SiteMethods < Block
  
  def initialize(title)
    @@models = []
    puts title
    @pages = []
  end
  
  class << self
    attr_accessor :models
  end
  
  def page(url)
    puts url
    doc = Nokogiri::HTML(open(url))
    @pages << doc
  end
  
  def record(klass, &block)
    @pages.each do |page|
      record_instance = RecordMethods.new(klass, page)
      Blockenspiel.invoke(block, record_instance)
    end
  end
  
end

class RecordMethods < Block
  include Scraper
  
  attr_reader :instance
  
  def initialize(klass, doc)
    @klass = klass.new
    @doc = doc
  end
  
  def title(str)
    @instance.send('title=', str)
  end
  
  def save_collection(klass, collection = [])
    collection.each do |page|
      klass.new(page.content)
      klass.save
    end
  end
  
end

# This is the root of the DSL
def site(title = nil, &block)
  Blockenspiel.invoke(block, SiteMethods.new(title))
end