source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 6.1.4", ">= 6.1.4.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "bootsnap", ">= 1.4.4", require: false
gem "rack-cors"

group :development, :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "ffaker"
end

group :development do
  gem "listen", "~> 3.3"
  gem "spring"
end
