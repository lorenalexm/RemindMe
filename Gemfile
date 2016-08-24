source 'https://rubygems.org'

gem 'rake', '~> 11.2.2'
gem 'puma', '~> 3.5.0'
gem 'sinatra', '~> 1.4.7'
gem 'sinatra-activerecord', '~> 2.0.10'
gem 'sidekiq', '~> 4.1.4'
gem 'twilio-ruby', '~> 4.11.1'
gem 'chronic', '~> 0.10.2'

group :production do
  gem 'pg', '~> 0.18.4'
end

group :development, :test do
  gem 'dotenv', '~> 2.1.1'
  gem 'sqlite3', '~> 1.3.11'
end

group :test do
  gem 'rspec', '~> 3.5.0'
end