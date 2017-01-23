class Shared::ContestAdminPolicy < ApplicationPolicy
  include Helpers::ContestPolicyHelper

  def contest
    record.contest
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    admin? && contest_editable?
  end

  def update?
    admin? && contest_editable?
  end

  def destroy?
    admin? && contest_editable?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
