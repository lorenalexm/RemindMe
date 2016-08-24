require_relative './app'
require 'sidekiq/web'

run Rack::URLMap.new('/' => RemindMe::App, '/sidekiq' => Sidekiq::Web)