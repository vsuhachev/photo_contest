class CompetitorsContest < ApplicationRecord
  belongs_to :competitor
  belongs_to :contest
end
