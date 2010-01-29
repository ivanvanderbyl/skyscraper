require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Skyscraper" do
  
  before(:each) do
    reader = Skyscraper::Base.load("#{EXAMPLE_PATH}/smh.cloud")
  end
  
  it "should respond to scrape block" do
    reader = 
  end
end
