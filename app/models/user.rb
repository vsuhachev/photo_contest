class User < ApplicationRecord
  include RoleModel

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  roles_attribute :roles_mask
  roles :admin, :competitor, :jury

  has_many :competitors
  has_many :photos
end
