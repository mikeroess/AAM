source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '~> 4.0.0'
gem 'sprockets-rails', '~> 2.1.4'

gem 'negative_captcha'
gem 'font-awesome-rails'
gem 'jquery-rails'

# URI parser used to get proper navbar function at small sizes
require 'uri'

group :development do
  # Use Capistrano for deployment
  gem 'capistrano', '3.3.3' # Pinned for compatibility with Ruby <= 1.9
  gem 'capistrano-rails'
  gem 'capistrano-passenger'

  # Assets.
  gem 'bootstrap-sass', '~> 3.3.6'
  gem 'sass-rails', '>= 3.2'
  gem 'sass', '~> 3.4'
  gem 'uglifier', '>= 1.3.0'
  gem 'therubyracer', platforms: :ruby
end
