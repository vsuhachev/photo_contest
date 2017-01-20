class Public::BaseController < ApplicationController
  after_action :verify_authorized

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  class PublicAccess < Struct.new(:contest)
    def policy_class
      PublicAccessPolicy
    end
  end

  def auth_context
    PublicAccess.new(@contest)
  end

  private

  def not_found_error(err)
    logger.debug { err.inspect }
    head :not_found
  end
end