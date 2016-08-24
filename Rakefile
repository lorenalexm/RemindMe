require 'rake'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'
require 'dotenv/tasks'

namespace :db do
  task :load_config do
    require_relative './app'
  end
end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = Dir.glob('spec/**/*_spec.rb')
end

task :default => :spec