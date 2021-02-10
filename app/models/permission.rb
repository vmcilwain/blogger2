class Permission < ApplicationRecord
  validates :role_id, :user_id, presence: true
end
