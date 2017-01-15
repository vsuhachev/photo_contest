class JurorPolicy < ContestDependentPolicy
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
    if admin?
      [:fio1, :fio2, :fio3, :dob, :location, :description, :user_id]
    elsif owner?
      [:fio1, :fio2, :fio3, :dob, :location, :description]
    else
      []
    end
  end

  class Scope < Scope
    def resolve
      case
        when user.has_role?(:admin)
          scope
        else
          scope.where(user_id: user)
      end
    end
  end
end
