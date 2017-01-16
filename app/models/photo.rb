class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :user
  belongs_to :nomination
  belongs_to :competitor
  has_one :contest, through: :competitor

  validates :image, :title, :location, :obtained_at, :description, presence: true

  def to_s
    title
  end
end
