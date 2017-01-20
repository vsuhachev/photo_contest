class Public::PhotosController < Public::BaseController
  before_action :set_parents

  def index
    authorize auth_context
    @photos = @nomination.photos
  end

  def show
    authorize auth_context
    @photo = @nomination.photos.find(params[:photo_id])
    add_breadcrumb @photo, public_contest_nomination_photo_path(@contest, @nomination, @photo)
  end

  private

  def set_parents
    @contest = policy_scope(auth_context).find(params[:contest_id])
    @nomination = @contest.nominations.find(params[:nomination_id])

    add_breadcrumb I18n.t('public.contests.index.title'), :public_contests_path
    add_breadcrumb @contest, public_contest_nominations_path(@contest)
    add_breadcrumb @nomination, public_contest_nomination_photos_path(@contest, @nomination)
  end
end
