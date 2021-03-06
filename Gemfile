# frozen_string_literal: true
source "https://rubygems.org"

gem "bundler", ">= 1.7.0"
ruby "2.3.3"

gem "figaro", "~> 1.0.0"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.1"

gem "coffee-rails", "~> 4.2"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "turbolinks", "~> 5"

gem "awesome_print"
gem "email_validator", "~> 1.5.0"
gem "ffaker"
gem "friendly_id", "~> 5.1.0"
gem "pry-rails"
gem "simple_form"

gem "octokit", "~> 4.0"

gem "newrelic_rpm"
gem "rollbar"

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "guard-livereload"
  gem "guard-rubocop"
  gem "letter_opener"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "i18n-tasks"
  gem "pry-byebug"
  gem "rspec-rails"
  gem "rubocop"
  gem "scss_lint", require: false
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "guard-rspec"
  gem "launchy"
  gem "shoulda-matchers", require: false

  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem "oj", "~> 2.12.14"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
