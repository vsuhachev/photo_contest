module Public::ContestPart
  extend ActiveSupport::Concern

  included do
    before_action :set_contest
  end

  protected

  def set_contest
    @contest = policy_scope(auth_context).find(params[:contest_id])

    add_breadcrumb t('public.contests.index.title'), :public_contests_path
    add_breadcrumb @contest, public_contest_nominations_path(@contest)
  end
end