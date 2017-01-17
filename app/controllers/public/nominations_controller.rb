class Public::NominationsController < Public::BaseController
  before_action :set_parents

  def index
    @nominations = @contest.nominations
  end

  private

  def set_parents
    @contest = Contest.active.find(params[:contest_id])

    add_breadcrumb I18n.t('public.contests.index.title'), :public_contests_path
    add_breadcrumb @contest, public_nominations_path(@contest)
  end
end
