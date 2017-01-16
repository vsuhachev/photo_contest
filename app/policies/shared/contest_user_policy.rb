class Shared::ContestUserPolicy < ApplicationPolicy
  include Helpers::ContestPolicyHelper

  def contest
    record.contest
  end

  def index?
    true
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
