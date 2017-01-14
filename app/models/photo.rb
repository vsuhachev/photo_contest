class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :user

  validates :image_data, presence: true

  def to_s
    title
  end
end
