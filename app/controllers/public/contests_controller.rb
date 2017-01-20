class Public::ContestsController < Public::BaseController
  before_action :set_contest, only: [:about, :competitors, :jurors]

  def index
    add_breadcrumb t('public.contests.index.title'), :public_contests_path
    @contests = Contest.active
  end

  def about
    add_breadcrumb t('.title')
  end

  def competitors
    add_breadcrumb t('.title')
    @competitors = @contest.competitors
  end

  def jurors
    add_breadcrumb t('.title')
    @jurors = @contest.jurors
  end

  private

  def set_contest
    @contest = Contest.active.find(params[:contest_id])

    add_breadcrumb t('public.contests.index.title'), :public_contests_path
    add_breadcrumb @contest, public_contest_nominations_path(@contest)
  end
end
