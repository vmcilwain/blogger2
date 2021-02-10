require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:role_id).of_type(:integer)
                                   .with_options(null: false, default: 0)
    should have_db_column(:user_id).of_type(:integer)
                                   .with_options(null: false, default: 0)
  end

  context 'validations' do
    should validate_presence_of :role_id
    should validate_presence_of :user_id
  end
end
