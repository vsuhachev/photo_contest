module Shared::RatingsHelper
  def ratings_by_criterion(photo, juror)
    juror.nil? ? {} : juror.ratings.for_photo(photo).map { |rating| [rating.criterion_id, rating] }.to_h
  end
end
