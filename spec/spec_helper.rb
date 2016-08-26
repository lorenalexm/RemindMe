ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require 'sidekiq/testing'

Sidekiq::Testing.fake!

module TestingMixin
  include Rack::Test::Methods
end

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation

  config.include TestingMixin

  config.before :each do
    Sidekiq::Worker.clear_all
  end
end