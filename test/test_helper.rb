ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Shrine.plugin :data_uri

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

ActionDispatch::IntegrationTest.include(Devise::Test::IntegrationHelpers)

require 'shrine/storage/memory'

Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new,
}

ActiveJob::Base.queue_adapter = :inline
