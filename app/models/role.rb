class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }

  has_many :permissions
  has_many :users, through: :permissions

  def user?(user)
    users.include? user
  end
end
