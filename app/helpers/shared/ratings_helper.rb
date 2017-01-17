module Shared::RatingsHelper
  def ratings_by_criterion(photo, user)
    Rating.for_photo(photo).owned_by(user).map { |rating| [rating.criterion_id, rating] }.to_h
  end
end