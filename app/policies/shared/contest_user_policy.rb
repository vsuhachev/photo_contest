class Shared::ContestUserPolicy < ApplicationPolicy
  include Helpers::ContestPolicyHelper

  def contest
    record.contest
  end

  def index?
    true
  end

  def create?
    (admin? || owner?) && contest_editable?
  end

  def update?
    (admin? || owner?) && contest_editable?
  end

  def destroy?
    (admin? || owner?) && contest_editable?
  end

  class Scope < Scope
    def contest_published?
      %i(in_progress finished archived).include?(contest_state)
    end

    def contest_state
      scope.first&.contest&.state_machine&.state
    end

    def resolve
      case
        when admin? || contest_published?
          scope
        else
          scope.where(user_id: user)
      end
    end
  end
end
