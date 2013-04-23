require 'rubygems'
require 'capybara/rspec'
require 'database_cleaner'

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
    if example.metadata[:js]
      Capybara.current_driver = :webkit
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end