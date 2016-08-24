require 'rubygems'
require 'bundler'
Bundler.require

require 'dotenv'
Dotenv.load

require 'sinatra/base'
require 'sinatra/activerecord'

require 'sidekiq'
Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_CONNECTION'] }
end

require 'twilio-ruby'
require 'chronic'

module RemindMe
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension
    set :database_file, './database.yml'
  end
end