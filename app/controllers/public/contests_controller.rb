class Public::ContestsController < Public::BaseController
  before_action :set_contest, only: [:about, :competitors, :jurors]

  def index
    authorize auth_context
    @contests = policy_scope(auth_context).all
    add_breadcrumb t('public.contests.index.title'), :public_contests_path
  end

  def about
    authorize auth_context
    add_breadcrumb t('.title')
  end

  def competitors
    authorize auth_context
    add_breadcrumb t('.title')
    @competitors = policy_scope(auth_context).competitors
  end

  def jurors
    authorize auth_context
    add_breadcrumb t('.title')
    @jurors = policy_scope(auth_context).jurors
  end

  private

  def set_contest
    @contest = policy_scope(auth_context).find(params[:contest_id])

    add_breadcrumb t('public.contests.index.title'), :public_contests_path
    add_breadcrumb @contest, public_contest_nominations_path(@contest)
  end
end
