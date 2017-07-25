require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app/models/link'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
