Bundler.setup
require 'sprockets'
require './app'

map '/assets' do
  foundation_path = Bundler.load.specs.select{|g| g.name == 'foundation-rails'}.first.full_gem_path

  environment = Sprockets::Environment.new
  environment.cache = Sprockets::Cache::FileStore.new('/tmp')

  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/images'
  environment.append_path 'assets/fonts'
  environment.append_path "#{foundation_path}/vendor/assets/javascripts"
  environment.append_path "#{foundation_path}/vendor/assets/stylesheets"
  run environment
end

set :raise_errors, true
run App
