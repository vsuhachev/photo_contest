module ContestControllerPart
  extend ActiveSupport::Concern

  included do
    before_action :set_contest, only: [:new, :create, :index]

    add_breadcrumb I18n.t("contests.index.title"), :contests_path
    add_breadcrumb ->(c) { c.instance_variable_get(:@contest) }, ->(c) { c.contest_path(c.instance_variable_get(:@contest)) }
  end

  def set_contest
    @contest = Contest.find(params[:contest_id])
  end
end
