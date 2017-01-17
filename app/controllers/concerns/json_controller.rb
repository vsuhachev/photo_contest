module JsonController
  extend ActiveSupport::Concern

  included do
    before_action :force_json
  end

  protected

  def force_json
    head :not_acceptable unless params[:format] == 'json' || request.body.read.blank? || request.headers["Accept"] =~ /application\/json/
  end
end