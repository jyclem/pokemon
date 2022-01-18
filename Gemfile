source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
gem 'pg', '~> 1.2.3'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Rswag
gem 'rswag-api', '~> 2.4.0'
gem 'rswag-ui', '~> 2.4.0'

# Faraday (HTTP client)
gem 'faraday', '~> 2.1.0'
gem 'faraday-httpclient', '~> 2.0'

# Redis (used here to manage cache)
gem 'redis', '~> 4.5.1'

group :development, :test do
  gem 'sqlite3', '~> 1.4'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Rspec
  gem 'rspec-rails', '~> 5.0.0'

  # Rubocop
  gem 'rubocop', '~> 1.25', require: false
  gem 'rubocop-performance', '~> 1.13.2', require: false
  gem 'rubocop-rails', '~> 2.13.2', require: false
  gem 'rubocop-rspec', '~> 2.7.0', require: false

  # Rswag (for tests)
  gem 'rswag-specs', '~> 2.4.0'

  # FactoryBot
  gem 'factory_bot_rails', '~> 6.2.0'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'webmock', '~> 3.14.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
