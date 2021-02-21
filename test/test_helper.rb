require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require_relative 'support/integration_helpers'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
class ActionDispatch::IntegrationTest
  include Support::IntegrationHelpers
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end

def add_user_to_role(user, role)
  role.users << user
end

def admin_user
  role = create :role, name: 'administrator'
  user = create :user
  add_user_to_role user, role
  user
end

def sample_string(number = 5, joiner = "\s")
  Faker::Lorem.words(number: number).join(joiner)
end

def sample_text(number = 5, joiner = "\n")
  Faker::Lorem.paragraphs(number: number).join(joiner)
end
