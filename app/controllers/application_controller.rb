class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_breadcrumb I18n.t('app.crumbs.home'), :root_path
end
