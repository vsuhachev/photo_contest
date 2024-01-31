class Public::ContestsController < Public::BaseController
  include Public::ContestPart

  before_action :set_contest, except: [:index]

  def index
    authorize auth_context
    @contests = policy_scope(auth_context).all
    add_breadcrumb t("public.contests.index.title"), :public_contests_path
  end

  def show
    authorize auth_context
    add_breadcrumb t(".title")
  end
end
