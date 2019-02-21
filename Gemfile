source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'activestorage-validator'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'fast_jsonapi'
gem 'friendly_id'
gem 'jwt_sessions'
gem 'mini_magick', '~> 4.8'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rack-cors'
gem 'rails', '~> 5.2.2'# Use postgresql as the database for Active Record
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'sentry-raven'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'jazz_fingers'
  gem 'json-schema'
  gem 'mock_redis'
  gem 'rspec-rails'
  gem 'simplecov'
end

gem 'dotenv-rails', groups: [:development, :test, :production]

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
