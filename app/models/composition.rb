class Composition < ApplicationRecord
  belongs_to :competitor
  belongs_to :photo
  belongs_to :contest
  belongs_to :nomination

  has_one :user, through: :photo

  scope :authored, -> (user) { joins(:photo).where(photos: { user: user }) }

  validates :photo, uniqueness: { scope: [:contest] }
  validate do
    errors.add(:base, 'photo must belongs to competitor') if (photo || competitor) && competitor&.user != photo&.user
    errors.add(:base, 'nomination must belongs to contest') if nomination && contest != nomination&.contest
  end

  def to_s
    photo.to_s
  end
end
