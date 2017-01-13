module ContestControllerPart
  extend ActiveSupport::Concern

  included do
    before_action :set_contest, only: [:new, :create, :index]
  end

  def set_contest
    @contest = Contest.find(params[:contest_id])
  end
end