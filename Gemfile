source "https://rubygems.org"

ruby "3.2.3"

gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "sass-rails"  # Allow ruby to interpret sass so we can easily change the app's color palette
gem "bootstrap", '~> 5.3.2' # Importing bootstrap means that it comes uncompiled, so we can change scss values

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
