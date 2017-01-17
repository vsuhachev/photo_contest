class AdminController < ApplicationController
  include Pundit

  before_action :authenticate_user!
  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(err)
    flash[:alert] = 'You are not authorized to perform this action.'
    logger.debug { err.inspect }
    redirect_to(request.referrer || root_path)
  end
end
