class JurorPolicy < AdminOwnedPolicy
  def index?
    true
  end

  def show?
    super || user == record.user
  end

  def update?
    super || user == record.user
  end

  def permitted_attributes
    if user.has_role?(:admin)
      [:fio1, :fio2, :fio3, :dob, :location, :description, :user_id]
    elsif user == record.user
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
