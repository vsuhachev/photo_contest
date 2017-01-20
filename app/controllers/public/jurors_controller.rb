class Public::JurorsController < Public::BaseController
  include Public::ContestPart

  def index
    authorize auth_context
  end

  def show
    authorize auth_context
    @juror = @jurors.find(params[:id])
    add_breadcrumb @juror
  end

  protected

  def set_contest
    super
    @jurors = @contest.jurors
    add_breadcrumb t('.index.title'), public_contest_jurors_path(@contest)
  end
end
