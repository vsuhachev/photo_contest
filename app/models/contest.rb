class Contest < ApplicationRecord
  has_many :nominations
  has_many :criteria

  has_many :competitors_contests
  has_many :competitors, through: :competitors_contests

  has_many :photos, class_name: 'ContestPhoto'
  has_many :jurors

  scope :active_competitors, -> { competitors }

  validates :title, presence: true

  def to_s
    title
  end
end
