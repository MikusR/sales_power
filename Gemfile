source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>= 3.2.0'

gem 'dotenv', groups: %i[development test]
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.0'

gem 'drb' # Should be an explicit activesupport dep. Try removing with Ruby v3.4
gem 'mutex_m' # Should be an explicit activesupport dep. Try removing with Ruby v3.4

gem 'strong_migrations'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :test do
  gem 'factory_bot_rails', '~> 6.4' # allows `create(:product)` etc. easy setup
  gem 'rspec-rails', '~> 6.1' # CLI spec runner. `rspec spec/models/`
  gem 'shoulda-matchers', '~> 6.2' # allows `expect(model_instance).to have_many(:assocs)`
  gem 'simplecov', '~> 0.22', require: false # `COVERAGE=true rspec` to get spec coverage report
  gem 'timecop' # allows `Timecop.freeze("2024-05-20 12:00")`
  gem 'webmock', '~> 3.23', require: false # allows `stub_request(:any, "www.example.com")`
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
