module Scrapeable
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    attr_accessor :models
    
    def scrape(name = :master, &block)
      @scrapes ||= {}
      if block_given?
        @scrapes[name] = block
        models ||= []
        models << self
        
        p models
      end
      @scrapes[name]
    end
  end
  
end