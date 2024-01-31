class ContestPolicy < ApplicationPolicy
  include Helpers::ContestPolicyHelper

  def contest
    record
  end

  def index?
    true
  end

  def create?
    admin?
  end

  def update?
    admin? && contest_editable?
  end

  def destroy?
    admin? && contest_destroyable?
  end

  def transition?
    admin?
  end

  class Scope < Scope
    def resolve
      if admin?
        scope
      else
        scope.published
      end
    end
  end
end
