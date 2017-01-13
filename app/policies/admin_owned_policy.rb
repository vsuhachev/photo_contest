class AdminOwnedPolicy < ApplicationPolicy
  def index?
    user.has_role?(:admin)
  end

  def show?
    user.has_role?(:admin)
  end

  def create?
    user.has_role?(:admin)
  end

  def update?
    user.has_role?(:admin)
  end

  def destroy?
    user.has_role?(:admin)
  end

  class Scope < Scope
    def resolve
      case
        when user.has_role?(:admin)
          scope
        else
          fail Pundit::NotAuthorizedError, 'invalid scope'
      end
    end
  end
end
