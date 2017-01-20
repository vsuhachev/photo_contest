class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  add_breadcrumb I18n.t('app.crumbs.home'), :root_path

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(err)
    flash[:alert] = 'You are not authorized to perform this action.'
    logger.debug { err.inspect }
    redirect_to(request.referrer || root_path)
  end
end
