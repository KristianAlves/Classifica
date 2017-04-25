source 'https://rubygems.org'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# The safe Markdown parser, reloaded.
gem 'redcarpet'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Rails gem of the Bootstrap based admin theme SB Admin 2
gem 'bootstrap_sb_admin_base_v2'
#O Lero-lero Generator é uma ferramenta capaz de gerar frases que 'falam' muita coisa mas que não tem conteúdo algum.
gem 'lerolero_generator'
# Integration of RubyMoney - Money with Rails
gem 'money-rails'
# Easy file attachment management for ActiveRecord https://thoughtbot.com/open-source
gem 'paperclip', '~> 5.0.0'
# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'
# FriendlyId is the “Swiss Army bulldozer” of slugging and permalink plugins for ActiveRecord.
gem 'friendly_id'
# If Turbolinks are not enough for you. Wiselinks makes your application work faster.
gem 'wiselinks'
# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps
gem 'kaminari'
# Translations for the kaminari gem
gem 'kaminari-i18n'
# Generate Entity-Relationship Diagrams for Rails applications
gem "rails-erd"
# A Ruby Gem that wraps the functionality of jQuery Raty library, and provides optional IMDB style rating.
gem 'ratyrate'
# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker'
# Markdown Lorem Ipsum generator
gem 'doctor_ipsum'


source 'https://rails-assets.org' do
    #bootstrap - The most popular front-end framework for developing responsive, mobile first projects on the web.
    gem 'rails-assets-bootstrap', '3.3.7'
    #Bootbox (Caixa de confirmação)
    gem 'rails-assets-bootbox'
    # Bootstrap Notify
    gem 'rails-assets-bootstrap.growl'
    # Animate CSS
    gem 'rails-assets-animate.css'
    #Bootstrap Markdown
    gem 'rails-assets-bootstrap-markdown'
    #Marked
    gem 'rails-assets-marked'
end

# I18n
gem 'rails-i18n'
gem 'devise-i18n-views'
# Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'enum_help'
#Minimal authorization through OO design and pure Ruby classes
gem "pundit"
# Manage Procfile-based applications
gem 'foreman'
# Flexible authentication solution for Rails with Warden
gem 'devise'
gem 'devise-i18n'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  #Catches mail and serves it through a dream
  gem 'mailcatcher'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  #Generate Entity-Relationship Diagrams for Rails applications
  gem "rails-erd"
  # gem better Errors
  gem 'better_errors'
  gem "binding_of_caller"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Gem Capistrano
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rvm'
  gem 'capistrano3-unicorn'
end

group :production do
  gem 'mysql2', '~> 0.3.18'
  gem 'unicorn'
  gem 'mailgun-ruby', '~>1.1.4'
end