# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require 'database_cleaner'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../app.rb', __dir__

module RSpecMixin
  include Rack::Test::Methods
  def app
    described_class
  end
end
DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include RSpecMixin
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
