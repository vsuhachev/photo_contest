class Competitor < ApplicationRecord
  belongs_to :user
  has_many :competitors_contests
  has_many :contests, through: :competitors_contests

  scope :active_contests, -> { contests }

  validates :fio1, :fio2, presence: true

  def fio
    [fio1, fio2, fio3].compact.join(' ')
  end

  alias_method :to_s, :fio
end
