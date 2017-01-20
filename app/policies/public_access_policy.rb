class PublicAccessPolicy < ApplicationPolicy
  def index?
    true
  end

  alias_method :about?, :index?
  alias_method :competitors?, :index?
  alias_method :jurors?, :index?
  alias_method :show?, :index?

  def juror?
    user && (contest ? contest.user_is_juror?(user) : !user.jurors.empty?)
  end

  def contest
    record.contest
  end

  def state
    contest&.state_machine&.current
  end

  def active?
    case state
      when :preparation
        juror? || admin?
      when :in_progress, :finished
        true
      else
        false
    end
  end

  class Scope < Scope
    def policy
      @policy ||= PublicAccessPolicy.new(user, scope)
    end

    delegate :admin?, :juror?, :contest, to: :policy

    def resolve
      case
        when admin?
          contest || Contest.juror_active
        when juror?
          contest || Contest.juror_active.by_juror_user(user)
        else
          contest || Contest.active
      end
    end
  end
end
