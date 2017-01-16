class ContestPolicy < LoggedUserPolicy
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
      case
        when admin?
          scope
        else
          scope.published
      end
    end
  end

  protected

  def contest
    record
  end

  def state_machine
    contest&.state_machine
  end
  
  def contest_editable?
    state_machine&.draft? || state_machine&.preparation?
  end

  def contest_destroyable?
    state_machine&.draft?
  end

  def contest_enabled?
    state_machine&.preparation?
  end
end
