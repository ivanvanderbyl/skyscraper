$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib", "sky_scraper"))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'skyscraper'
require 'spec'
require 'spec/autorun'

EXAMPLE_PATH = File.join(File.dirname(__FILE__), '..', 'examples')

Spec::Runner.configure do |config|
  
end
