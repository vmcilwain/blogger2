class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :first_name, :last_name, presence: true

  has_many :permissions
  has_many :roles, through: :permissions

  def role?(name)
    roles.map(&:name).include?(name.to_s)
  end
end
