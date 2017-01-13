class UserOwnedPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user == record.user
  end

  def create?
    user == record.user
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user)
    end
  end
end
