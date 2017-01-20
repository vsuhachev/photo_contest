class Public::NominationsController < Public::BaseController
  include Public::ContestPart

  def index
    authorize auth_context
    @nominations = @contest.nominations
  end
end
