module Helpers::ContestPolicyHelper
  def contest_editable?
    contest&.state == "draft" || contest&.state == "preparation"
  end

  def contest_destroyable?
    contest&.state == "draft"
  end

  def contest_enabled?
    contest&.state == "preparation"
  end

  def contest_rating_able?
    contest&.state == "in_progress"
  end
end
