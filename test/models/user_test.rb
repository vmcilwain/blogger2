require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:first_name).of_type(:string)
                                      .with_options(null: false, default: '')
    should have_db_column(:last_name).of_type(:string)
                                     .with_options(null: false, default: '')
  end

  context 'validations' do
    should validate_presence_of :first_name
    should validate_presence_of :last_name
  end

  should have_many(:roles).through(:permissions)

  test '#role?' do
    permission = create :permission
    user = permission.user

    assert user.role?(permission.role.name.to_sym)

    role = create :role
    assert_not user.role?(role.name.to_sym)

    assert_not user.role?(nil)
  end
end
