module Helpers::ContestPolicyHelper
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