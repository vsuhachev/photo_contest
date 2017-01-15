class ContestPhotoPolicy < ContestDependentPolicy
  def index?
    true
  end

  def show?
    super || owner?
  end

  def create?
    (super || owner?) && contest_enabled?
  end

  def new?
    true
  end

  def update?
    (super || owner?) && contest_enabled?
  end

  def destroy?
    (super || owner?) && contest_enabled?
  end

  class Scope < Scope
    def resolve
      case
        when user.has_role?(:admin)
          scope
        else
          scope.authored(user)
      end
    end
  end
end
