require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Skyscraper" do
  
  before(:each) do
    @reader = Skyscraper::Base.new
  end
  
  it "should accept urls and add them to array" do
    @reader.parse %{
      scraper do
        page('http://www.news.com.au/breaking-news')
        page('http://www.news.com.au/world')
      end
    }
    
    @reader.dsl_instance.page_urls.should_not be_nil
  end
end
