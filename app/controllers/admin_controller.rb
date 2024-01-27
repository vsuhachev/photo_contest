class AdminController < ApplicationController
  include Pundit::Authorization

  before_action :authenticate_user!
  after_action :verify_authorized
end
