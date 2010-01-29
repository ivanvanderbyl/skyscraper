require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Skyscraper" do
  
  before(:each) do
    @reader = Skyscraper::Base.load("#{EXAMPLE_PATH}/news_com_au.cloud")
  end
  
  it "should respond to scrape block" do
    puts @reader.class.inspect
  end
end
