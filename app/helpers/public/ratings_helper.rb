module Public::RatingsHelper
  def ratings_averages
    @ratings_averages ||= @ratings.averages_by_photo_and_criterion.each_with_object(Hash.new { |h, k| h[k] = 0 }) { |(k, v), acc| acc[k.first] += v if v }
  end

  def score_for_photo(photo)
    ratings_averages[photo.id]
  end

  def photos_sorted
    @photos_sorted ||= @photos.to_a.sort { |a, b| score_for_photo(b) <=> score_for_photo(a) }
  end
end
