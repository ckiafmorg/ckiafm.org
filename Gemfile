# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').chomp

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'bootstrap'
gem 'bootstrap-icons-helper'
gem 'sassc-rails'
gem 'sprockets-rails'

# Javascript / Hotwire
gem 'hotwire-rails'
gem 'importmap-rails'
gem 'stimulus-rails'

# markdown for blog and other textarea content
gem 'kramdown'
gem 'markdown_media'
gem 'stringex'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.4'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
# gem 'jsbundling-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
# gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 5.3'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.20'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.13'

# friendly_id
gem 'friendly_id', '~> 5.5.1'

# validate phone number
gem 'phonelib'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'factory_bot_rails'
  gem 'faker'
  gem 'minitest-rails'
  gem 'shoulda'

  # codestyle guide and linting
  gem 'rubocop', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false

  gem 'erb_lint', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
end

gem 'dockerfile-rails', '>= 1.6', :group => :development

gem 'aws-sdk-s3', '~> 1.173', :require => false
