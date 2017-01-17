class Public::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  private

  def not_found_error(err)
    logger.debug { err.inspect }
    render file: Rails.root.join('public', '404.html'), status: :not_found, layout: false
  end
end