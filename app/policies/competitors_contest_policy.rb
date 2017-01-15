class CompetitorsContestPolicy < UserOwnedPolicy
  def create?
    super && contest_ok?
  end

  def update?
    super && contest_ok?
  end

  def destroy?
    super && contest_ok?
  end

  private

  def contest_ok?
    record&.contest.state_machine.preparation?
  end
end
