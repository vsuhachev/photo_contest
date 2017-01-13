class ContestPhotoPolicy < ContestPolicy
  def index?
    true
  end

  def show?
    super || user == record.user
  end

  def create?
    super || user == record.user
  end

  def new?
    true
  end

  def update?
    super || user == record.user
  end

  def destroy?
    super || user == record.user
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
