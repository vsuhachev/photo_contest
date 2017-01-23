source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'

group :development, :test, :assets do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

# Use Puma as the app server
gem 'puma', '~> 3.0'

group :development, :test, :assets do
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 5.0'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use CoffeeScript for .coffee assets and views
  gem 'coffee-rails', '~> 4.2'
  # See https://github.com/rails/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks', '~> 5'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
end

gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

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

  gem 'letter_opener'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rails-i18n'

gem 'devise'
gem 'devise-i18n'
gem 'role_model'
gem 'pundit'

gem 'slim-rails'

group :development, :test, :assets do
  gem 'bootstrap'
  gem 'font-awesome-sass'
  gem 'trix'
end

gem 'breadcrumbs_on_rails'

gem 'shrine'
gem 'shrine-memory', group: :test
gem 'fastimage'
gem 'image_processing'
gem 'mini_magick', '>= 4.3.5'

gem 'finite_machine'

gem 'thor', '0.19.1' # FIXME: fix issue with "Expected string default value for '--jbuilder'; got true (boolean)" messsage

gem 'redis-rails'

gem 'sidekiq'
