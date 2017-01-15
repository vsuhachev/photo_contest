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
    def resolve
      case
        when admin?
          scope
        else
          scope.authored(user)
      end
    end
  end
end
