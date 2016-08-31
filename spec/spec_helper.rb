ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require 'rspec-sidekiq'
require 'sidekiq/testing'

require_relative '../app'
require_relative 'mocks/messaging_service'

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
    stub_const('Twilio::REST::Client', MessagingService)
    MessagingService.messages = []
  end
end