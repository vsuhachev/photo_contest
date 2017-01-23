class Nomination < ApplicationRecord
  belongs_to :contest, touch: true
  has_many :photos, dependent: :restrict_with_error

  validates :title, presence: true

  def to_s
    title
  end

  def photo
    photos.first
  end
end
