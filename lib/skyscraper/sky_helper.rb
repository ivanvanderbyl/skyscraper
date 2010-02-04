require File.join(File.dirname(__FILE__), "base")

def autorun # :nodoc:
  at_exit { exit run unless $! }
end