class Public::ContestsController < Public::BaseController
  def index
    @contests = Contest.active
    add_breadcrumb t('public.contests.index.title'), :public_contests_path
  end
end
