source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Production
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# deployment
group :development do
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end
gem 'puma'

# auth
gem 'devise'
gem 'cancancan', '~> 1.10'
gem 'rolify'

# frontend
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'slim-rails'
gem 'simple_form'
gem 'bootstrap-generators', group: :development

# grid view
gem 'wice_grid', '3.6.0.pre4'
gem 'font-awesome-sass', '~> 4.3'

# angular
gem 'angularjs-rails'
gem 'angular-rails-templates'

# chart (visualize publication activity)
gem 'chartkick'

# logging
gem 'mongodb_logger'
gem 'mongo'
gem 'bson_ext'
gem 'syslogger', group: :production

# settings
gem 'config'

# code style
group :development do
  gem 'rubocop', require: false
  gem 'slim_lint'
end

# RDF
gem 'sparql-client', '~> 1.1.6' # https://github.com/ruby-rdf/sparql-client
gem 'rdf-raptor'
gem 'sparql', '~> 1.1.9'
gem 'rdf-turtle'

gem 'faker'

# tasks - cron
gem 'whenever'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # tests
  gem 'rspec'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl'
  gem 'database_cleaner'
  # gem 'faker'
  gem 'capybara'
  gem 'simplecov', require: false, group: :test
  gem 'capybara-screenshot', group: :test
end
