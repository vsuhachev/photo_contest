class Photo < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user
  belongs_to :nomination, touch: true
  belongs_to :competitor
  belongs_to :contest

  has_many :ratings, dependent: :delete_all
  has_many :criteria, through: :contest

  validates :image, :title, :location, :obtained_at, presence: true
  validate do
    errors.add(:competitor, :must_belongs_to_you) if competitor && competitor.user != user
    errors.add(:nomination, :must_belongs_to_contest) if nomination && contest != nomination.contest
    errors.add(:base, :photos_limit) if photos_limit?
  end

  scope :by_nomination, -> (nomination) { where(nomination_id: nomination) }
  scope :by_competitor, -> (competitor) { where(competitor_id: competitor) }

  def photos_limit?
    nomination && competitor && Photo.by_nomination(nomination).by_competitor(competitor).count >= 3
  end

  def to_s
    title
  end
end
