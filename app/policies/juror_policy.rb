class JurorPolicy < Shared::ContestAdminPolicy
  def index?
    true
  end

  def show?
    super || owner? && contest_editable?
  end

  def update?
    super || owner? && contest_editable?
  end

  def permitted_attributes
    common_attributes = [
        :avatar,
        :fio1, :fio2, :fio3, :dob,
        :location, :organization,
        :description
    ]
    if admin?
      common_attributes << :user_id
    elsif owner?
      common_attributes
    else
      []
    end
  end
end
