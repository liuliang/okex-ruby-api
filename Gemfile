# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in okex-api.gemspec
gemspec

group :test do
  gem 'simplecov', '~> 0.22'
  gem 'httparty', '~> 0.21'
  gem 'openssl', '~> 3.1'
end

gem "rake"
gem "minitest"
gem "rubocop"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
end