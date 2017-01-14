class CompetitorsContest < ApplicationRecord
  belongs_to :competitor
  belongs_to :contest

  def to_s
    [competitor, contest].map(&:to_s).compact.join(' :: ')
  end
end
