class CompositionPolicy < ContestDependentPolicy
  def index?
    true
  end

  def show?
    admin? || owner?
  end

  def create?
    contest_enabled?
  end

  def update?
    (admin? || owner?) && contest_enabled?
  end

  def destroy?
    (admin? || owner?) && contest_enabled?
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
          scope.authored(user)
      end
    end
  end
end
