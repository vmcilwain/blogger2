require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:name).of_type(:string)
                                .with_options(null: false, default: '')
    should have_db_column(:description).of_type(:string)
  end

  context 'validations' do
    should validate_presence_of :name
    should validate_uniqueness_of :name
  end

  should have_many(:users).through(:permissions)

  test '#user?' do
    permission = create :permission
    role = permission.role

    assert role.user?(permission.user)

    user = create :user
    assert_not role.user?(user)

    assert_not role.user?(nil)
  end
end
