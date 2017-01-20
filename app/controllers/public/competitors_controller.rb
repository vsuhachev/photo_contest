class Public::CompetitorsController < Public::BaseController
  include Public::ContestPart

  def index
    authorize auth_context
  end

  def show
    authorize auth_context
    @competitor = @competitors.find(params[:id])
    add_breadcrumb @competitor
  end

  protected

  def set_contest
    super
    @competitors = @contest.competitors
    add_breadcrumb t('.index.title'), public_contest_competitors_path(@contest)
  end
end
