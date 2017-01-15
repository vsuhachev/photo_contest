class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :user

  validates :title, :image, presence: true

  def to_s
    title
  end
end
