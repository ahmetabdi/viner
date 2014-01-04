require 'unirest'
require 'hashie'
require File.join(File.dirname(__FILE__), "viner", "request")
require File.join(File.dirname(__FILE__), "viner", "client")

module Viner
  ENDPOINT = 'https://api.vineapp.com/'
end
