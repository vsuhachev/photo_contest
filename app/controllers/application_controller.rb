class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception

  add_breadcrumb I18n.t("app.crumbs.home"), :root_path

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authorize_mini_profiler

  private

  def mini_profiler_token
    @mini_profiler_token ||= ENV.fetch("RAILS_MINI_PROFILER_TOKEN", nil)
  end

  def mini_profiler?
    cookies[:mini_profiler] == mini_profiler_token
  end

  def authorize_mini_profiler
    Rack::MiniProfiler.authorize_request if Rails.env.development? || mini_profiler?
  end

  def user_not_authorized(err)
    flash[:alert] = "You are not authorized to perform this action."
    logger.debug { err.inspect }
    redirect_to(request.referrer || root_path)
  end
end
