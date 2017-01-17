class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :user
  belongs_to :nomination
  belongs_to :competitor
  belongs_to :contest

  has_many :ratings, dependent: :delete_all
  has_many :criteria, through: :contest

  validates :image, :title, :location, :obtained_at, :description, presence: true
  validate do
    errors.add(:competitor, :must_belongs_to_you) if competitor && competitor.user != user
    errors.add(:nomination, :must_belongs_to_contest) if nomination && contest != nomination.contest
  end

  def to_s
    title
  end
end
