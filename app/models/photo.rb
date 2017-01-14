class Photo < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :user

  def to_s
    title
  end
end
