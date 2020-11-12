source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'aasm', '~> 5.1.1'
gem 'activeadmin', '~> 2.7.0'
gem 'aws-sdk-s3', '~> 1.14'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.7.2'
gem 'draper', '~>4.0'
gem 'fastimage', '~> 2.1.7'
gem 'haml-rails', '~> 2.0'
gem 'image_processing', '~> 1.10'
gem 'jbuilder', '~> 2.7'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection', '~> 0.1'
gem 'pagy', '~> 3.5'
gem 'pg', '0.18.4'
gem 'puma', '~> 4.1'
gem 'pundit', '~> 2.1.0'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'sass-rails', '>= 6'
gem 'shrine', '~> 3.0'
gem 'simple_form', '~> 5.0.2'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'ffaker', '2.15.0'
  gem 'pry', '0.13.1'
  gem 'pry-rails', '0.3.9'
  gem 'rails-controller-testing', '1.0.5'
  gem 'rspec_junit_formatter', '0.4.1'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rubocop', require: false
  gem 'rubocop-performance', '1.7.1'
  gem 'rubocop-rails', '2.7.1'
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers', '4.4.1'
end

group :development do
  gem 'brakeman', '4.8.2'
  gem 'bullet', '6.1.0'
  gem 'bundler-audit', '0.7.0.1'
  gem 'database_consistency', '0.8.4', require: false
  gem 'fasterer', '0.8.3', require: false
  gem 'letter_opener_web', '~> 1.0'
  gem 'listen', '~> 3.2'
  gem 'overcommit', '~> 0.53.0', require: false
  gem 'spring', '2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver', '>= 3.0', '< 4.0'
  gem 'simplecov', '0.19.0', require: false, group: :test
  gem 'webdrivers'
end
