class Composition < ApplicationRecord
  belongs_to :competitor
  belongs_to :photo
  belongs_to :contest
  belongs_to :nomination

  has_one :user, through: :photo

  scope :authored, -> (user) { joins(:photo).where(photos: { user: user }) }

  delegate :title, :location, :obtained_at, :description, to: :photo

  validates :photo, uniqueness: { scope: [:contest] }
  validates :title, :location, :obtained_at, :description, presence: true
  validate do
    errors.add(:base, :photo_must_belongs_to_competitor) if (photo || competitor) && competitor&.user != photo&.user
    errors.add(:base, :nomination_must_belongs_to_contest) if nomination && contest != nomination&.contest
  end

  def to_s
    photo.to_s
  end
end
