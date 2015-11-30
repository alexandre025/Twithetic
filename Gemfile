source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'rails', '4.2.5'
# Use mysql as the database for Active Record

gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'autoprefixer-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use to set environment variables
gem 'figaro'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'passenger'
end

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'puma'

  # testing
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl'
  gem 'faker'
end

# Pretty slugs in url
gem 'friendly_id'

# Sessions manager
gem 'devise'

# Assets manager
gem 'paperclip', '~> 4.3'

# Pagination
gem 'kaminari'

# Search
gem 'ransack'

# Authorize
gem 'cancancan', '~> 1.10'

# Follow & likes
gem 'acts_as_follower'