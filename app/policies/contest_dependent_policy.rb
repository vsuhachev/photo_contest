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

  protected

  def contest
    record.contest
  end

  def owner?
    user == record.user
  end
end
