module PhotosHelper
  def nominations_list
    policy_scope(@contest.nominations).all
  end

  def competitors_list
    policy_scope(current_user.competitors).all
  end
end
