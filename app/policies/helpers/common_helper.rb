module Helpers::CommonHelper
  def admin?
    user&.has_role?(:admin)
  end

  def owner?
    user == record.user
  end
end