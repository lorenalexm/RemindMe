ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'

module TestingMixin
  include Rack::Test::Methods
end

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation

  config.include TestingMixin
end