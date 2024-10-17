source "https://rubygems.org"

ruby "3.3.1"

gem "rails", "~> 7.1.4"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

gem 'sidekiq'

gem 'faker'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 6.0'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
