source 'https://rubygems.org'

gem 'rails', '3.2.8'
#gem 'sqlite3-ruby', '1.2.5', :require => 'sqlite3' #Chad had to comment out line was causing issue
gem 'gravatar_image_tag', '0.1.0'
gem 'will_paginate', '3.0'

# added by chad faling dependicies needed for development
group :development do
  gem "rspec-rails", "~> 2.11.0"
  gem 'sqlite3'
  gem 'annotate'
  gem 'faker', '0.3.1'
end

group :production do
  gem 'pg'
end

group :test do 
  gem "rspec-rails", "~> 2.11.0"
  gem "rspec", "~> 2.11.0"
  gem 'webrat', '0.7.1'
  gem 'factory_girl_rails', '1.0'
end
# done with gems chad added


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
