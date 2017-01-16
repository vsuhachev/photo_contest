module ProfilePart
  extend ActiveSupport::Concern

  included do
    delegate :photos, :competitors, to: :profile_user, prefix: :my
    helper_method :my_photos, :my_competitors
  end

  def profile_user
    pundit_user
  end
end