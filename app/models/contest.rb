class Contest < ApplicationRecord
  has_many :nominations
  has_many :criteria

  has_many :competitors_contests
  has_many :competitors, through: :competitors_contests

  scope :active_competitors, -> { competitors }
end
