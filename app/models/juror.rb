class Juror < ApplicationRecord
  include AvatarUploader[:avatar]

  belongs_to :user
  belongs_to :contest

  has_many :ratings, dependent: :delete_all

  validates :fio1, :fio2, :location,  presence: true
  validates :user, uniqueness: { scope: [:contest] }

  def fio
    [fio1, fio2, fio3].compact.join(' ')
  end

  alias_method :to_s, :fio
end
