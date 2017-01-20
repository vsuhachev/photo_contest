module Shared::UsersHelper
  def full_view?(obj)
    policy(obj)&.admin?
  end

  def user_index_attributes(attributes, obj)
    attributes.tap do |attrs|
      attrs << :user if full_view?(obj)
    end
  end
end