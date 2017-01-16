module JurorsHelper
  def display_user?(obj = nil)
    permitted_attributes_for(obj || @contest.jurors.build).include?(:user_id)
  end

  def index_attributes
    attributes = %i(fio dob location)
    attributes << :user if display_user?
    attributes
  end
end
