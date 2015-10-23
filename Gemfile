source 'https://rails-assets.org'
source 'https://rubygems.org'
ruby "2.2.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
gem 'pg'
# Use mysql as the database for Active Record
# gem 'mysql2', '~> 0.3.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use SCSS of Bootstrap
gem 'bootstrap-sass', '3.3.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem 'rails_12factor', group: :production
# assets manage
gem 'rails-assets-angular', '1.3.0'
gem 'rails-assets-angular-route', '1.3.0'
gem 'rails-assets-angular-resource', '1.3.0'
gem 'rails-assets-angular-messages', '1.3.0'
gem 'rails-assets-angular-i18n', '1.3.0'
gem 'ng-rails-csrf'
gem 'angular-rails-templates'
gem 'angular-ui-bootstrap-rails'
gem 'bootstrap-modal-rails', '~> 2.2.5'
gem 'bootstrap-filestyle-rails'
gem 'momentjs-rails', '>= 2.8.1'
gem 'bootstrap3-datetimepicker-rails', '~> 3.1.3'
gem 'angularjs-file-upload-rails', '~> 1.1.6'
gem 'carrierwave'
gem 'rails-assets-angular-sanitize', '1.3.0'

# Fix wkhtmltopdf: error while loading shared libraries: libfontconfig.so.1
# yum install libXext  libXrender  fontconfig  libfontconfig.so.1
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

#gem 'compare_locale', :path => './mygems/LocaleCompare'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'therubyracer'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use meta-tags
gem 'meta-tags'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use rails-i18n
gem 'rails-i18n'

# Use I18n-js
gem 'i18n-js'

# Use validate email
gem 'validates_email_format_of'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Bluk Import
gem 'activerecord-import'

# Use
gem 'nokogiri-happymapper', require: 'happymapper'
# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'forgery', '0.6.0'
group :development, :test do
  gem 'rspec', '~> 3.1.0'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'i18n-tasks'
  gem 'turnip', '~> 1.2.4'
  # gem 'rails-erd', github: 'paulwittmann/rails-erd', branch: 'mavericks'
  gem 'yard'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'faker', '~> 1.4.3'
  gem 'capybara', '~> 2.4.4'
  gem 'poltergeist'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'selenium-webdriver', '~> 2.43.0'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'simplecov'
  gem 'simplecov-rcov'
  gem 'rspec-legacy_formatters'
  gem 'rubocop'
end
