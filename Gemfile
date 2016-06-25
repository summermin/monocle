source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rails_12factor'
gem 'haml'

gem 'devise'

gem 'sendgrid-rails'
gem "letter_opener", group: :development

gem "twilio-ruby"

gem 'sidekiq'

group :development, :test do
  gem 'byebug'
  gem 'pry'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'rspec'
end

group :production do
  gem 'unicorn'
end