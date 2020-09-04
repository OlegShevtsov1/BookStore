source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'pg', '0.18.4'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'puma', '~> 4.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'haml-rails', '~> 2.0'
gem 'sass-rails', '>= 5'
gem 'sprockets', '~> 3'
gem 'sprockets-rails', require: 'sprockets/railtie'

gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'jquery-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rails-controller-testing'
  gem 'rubocop-rspec', require: false
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers'
  gem 'ffaker'
  gem 'rspec_junit_formatter'
  gem 'pry'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'overcommit', '~> 0.53.0', require: false
  gem 'fasterer', '~> 0.8.3', require: false
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'database_consistency', require: false
  gem 'bullet'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'simplecov', require: false, group: :test
end
