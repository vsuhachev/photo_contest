class Competitor < ApplicationRecord
  belongs_to :user
  has_many :competitors_contests
  has_many :contests, through: :competitors_contests

  scope :active_contests, -> { contests }

  validates :user, :fio1, :fio2, presence: true

  def to_s
    [fio1, fio2, fio3].compact.join(' ')
  end
end
