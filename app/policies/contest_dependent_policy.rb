class ContestDependentPolicy < ContestPolicy
  def create?
    super && contest_editable?
  end

  def update?
    super && contest_editable?
  end

  def destroy?
    super && contest_editable?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  protected

  def contest
    record.contest
  end
end
