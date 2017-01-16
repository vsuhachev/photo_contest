module CompositionsHelper
  class ListItem < SimpleDelegator
    def to_s
      "[#{user.email}] #{super}"
    end
  end

  def photos_list
    policy_scope(Photo).all.order('user_id asc').map { |obj| ListItem.new(obj) }
  end

  def competitors_list
    policy_scope(Competitor).all.order('user_id asc').map { |obj| ListItem.new(obj) }
  end
end
