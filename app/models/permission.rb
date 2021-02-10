class Permission < ApplicationRecord
  validates :role_id, :user_id, presence: true

  belongs_to :role
  belongs_to :user
end
