source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

#pin photo icon
gem 'material_icons'
#secret keys gem
gem 'figaro'
#geocoding gem
gem 'geocoder'
#photo uploading extension
gem "mini_magick"
#photouploading
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
#add facebook auth gems
gem 'omniauth-facebook'
gem 'omniauth'
# authorization to use strava APIs
gem 'omniauth-strava-oauth2', '~> 0.0.2'
#user password gem
gem 'clearance'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
<<<<<<< HEAD
=======
gem 'pg', '~> 0.20'
>>>>>>> heroku
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'bootstrap-sass', '~> 3.3.7'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use figaro to keep hidden files from uploading to github
# gem 'figaro'
# Use fog for storing documents with S3
gem 'pg'
gem 'fog', require: 'fog/aws'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'pg_search'
# mining data from strava runs
gem 'strava-api-v3'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
