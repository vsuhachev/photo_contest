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
        juror?
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

    delegate :juror?, :contest, to: :policy

    def resolve
      case
        when juror?
          contest || Contest.juror_active
        else
          contest || Contest.active
      end
    end
  end
end
