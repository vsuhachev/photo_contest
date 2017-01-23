class Competitor < ApplicationRecord
  include AvatarUploader[:avatar]

  belongs_to :user
  belongs_to :contest, touch: true
  has_many :photos, dependent: :restrict_with_error

  validates :fio1, :fio2, :location, presence: true

  def fio
    [fio1, fio2, fio3].compact.join(' ')
  end

  alias_method :to_s, :fio

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
