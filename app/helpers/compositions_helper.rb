module CompositionsHelper
  def photos_list
    policy_scope(Photo).all
  end

  def competitors_list
    policy_scope(Competitor).all
  end
end
