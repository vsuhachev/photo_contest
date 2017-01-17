class HomeController < AdminController
  skip_before_action :authenticate_user!

  def self.policy_class
    ApplicationPolicy
  end

  def index
    skip_authorization
  end
end
