class User < ApplicationRecord
  include RoleModel

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  roles_attribute :roles_mask
  roles :admin, :competitor, :jury

  has_many :competitors, dependent: :nullify
  has_many :photos, dependent: :nullify
  has_many :jurors, dependent: :nullify

  def title
    email.split('@').first
  end

  alias_method :to_s, :title

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
