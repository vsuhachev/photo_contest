class Competitor < ApplicationRecord
  include AvatarUploader[:avatar]

  belongs_to :user
  belongs_to :contest
  has_many :photos, dependent: :restrict_with_error

  validates :fio1, :fio2, :location, presence: true

  def fio
    [fio1, fio2, fio3].compact.join(' ')
  end

  alias_method :to_s, :fio
end
