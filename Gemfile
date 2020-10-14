source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'activeadmin'
gem 'aws-sdk-s3', '~> 1.14'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'draper', '~>4.0'
gem 'fastimage'
gem 'haml-rails', '~> 2.0'
gem 'image_processing', '~> 1.10'
gem 'jbuilder', '~> 2.7'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection', '~> 0.1'
gem 'pagy', '~> 3.5'
gem 'pg', '0.18.4'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'sass-rails', '>= 6'
gem 'shrine', '~> 3.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers'
end

group :development do
  gem 'brakeman'
  gem 'bullet'
  gem 'bundler-audit'
  gem 'database_consistency', require: false
  gem 'fasterer', require: false
  gem 'letter_opener_web', '~> 1.0'
  gem 'listen', '~> 3.2'
  gem 'overcommit', '~> 0.53.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false, group: :test
  gem 'webdrivers'
end
