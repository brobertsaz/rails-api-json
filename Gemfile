source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'activestorage-validator'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'fast_jsonapi'
gem 'friendly_id'
gem 'jwt'
gem 'knock'
gem 'mini_magick', '~> 4.8'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rack-cors'
gem 'rails', '~> 5.2.2'
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'sentry-raven'
gem 'sidekiq'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'jazz_fingers'
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
