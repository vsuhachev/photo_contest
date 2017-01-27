class Public::RatingsController < Public::BaseController
  include Public::ContestPart

  def index
    authorize auth_context, :ratings?
    add_breadcrumb t('.title')

    @ratings = (@nomination ? Rating.for_nomination(@nomination) : Rating.for_contest(@contest)).no_jurors_photos
    @photos = @contest.photos.preload(:contest, :nomination, :competitor)
    @photos = @photos.by_nomination(@nomination) if @nomination
  end

  def show
    authorize auth_context, :detailed_ratings?
    add_breadcrumb t('.title')

    @ratings = @photo.ratings.preload(:juror, :criterion).no_jurors_photos
  end

  protected

  def set_contest
    super
    if params[:nomination_id].present?
      @nomination = @contest.nominations.find(params[:nomination_id])
      add_breadcrumb @nomination, public_contest_nomination_photos_path(@contest, @nomination)
    end
    if params[:photo_id].present?
      @photo = @nomination.photos.find(params[:photo_id])
      add_breadcrumb @photo, public_contest_nomination_photo_path(@contest, @nomination, @photo)
    end
  end
end
