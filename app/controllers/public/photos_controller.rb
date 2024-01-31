class Public::PhotosController < Public::BaseController
  include Public::ContestPart

  def index
    authorize auth_context
    @photos = @nomination.photos
  end

  def show
    authorize auth_context
    @photo = @nomination.photos.find(params[:photo_id])
    @juror = current_user ? @contest.jurors.find_by(user_id: current_user) : nil
    @ratings_voting_enabled = @juror ? policy(Rating.new(photo: @photo, juror: @juror))&.create? : false
    @ratings_results_enabled = @contest.state == "finished" || @contest.state == "in_progress" && current_user&.has_role?(:admin)
    add_breadcrumb @photo, public_contest_nomination_photo_path(@contest, @nomination, @photo)
  end

  protected

  def set_contest
    super
    @nomination = @contest.nominations.find(params[:nomination_id])
    add_breadcrumb @nomination, public_contest_nomination_photos_path(@contest, @nomination)
  end
end
