class Shared::ContestUserPolicy < ApplicationPolicy
  include Helpers::ContestPolicyHelper

  def contest
    record.contest
  end

  def index?
    true
  end

  def show?
    admin? || owner?
  end

  def create?
    (admin? && contest_editable?) || contest_enabled?
  end

  def update?
    (admin? && contest_editable?) || (owner? && contest_enabled?)
  end

  def destroy?
    (admin? && contest_editable?) || (owner? && contest_enabled?)
  end

  class Scope < Scope
    def resolve
      if admin?
        scope
      else
        scope.where(user_id: user)
      end
    end
  end
end
