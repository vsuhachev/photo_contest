class ContestPolicy < AdminOwnedPolicy
  def update?
    super && contest_editable?
  end

  def destroy?
    super && contest_destroyable?
  end

  protected

  def contest
    record
  end

  def contest_editable?
    contest.state_machine.draft? || contest.state_machine.preparation?
  end

  def contest_destroyable?
    contest.state_machine.draft?
  end

  def contest_enabled?
    contest.state_machine.preparation?
  end
end
