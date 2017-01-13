class Competitor < ApplicationRecord
  belongs_to :user
  has_many :competitors_contests
  has_many :contests, through: :competitors_contests

  scope :active_contests, -> { contests }
end
