class AdminOwnedPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  class Scope < Scope
    def resolve
      case
        when admin?
          scope
        else
          fail Pundit::NotAuthorizedError, 'invalid scope'
      end
    end
  end
end
