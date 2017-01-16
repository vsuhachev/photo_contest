class LoggedUserPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    admin? || owner?
  end

  def update?
    admin? || owner?
  end

  def destroy?
    admin? || owner?
  end

  class Scope < Scope
    def resolve
      case
        when admin?
          scope
        else
          scope.where(user_id: user)
      end
    end
  end
end
