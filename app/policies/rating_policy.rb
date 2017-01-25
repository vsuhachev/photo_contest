class RatingPolicy < Shared::ContestUserPolicy

  def create?
    juror? && contest_rating_able?
  end

  def update?
    owner? && contest_rating_able?
  end

  def destroy?
    owner? && contest_rating_able?
  end

  class Scope < Scope
    def resolve
      case
        when admin?
          scope
        else
          scope.owned_by(user)
      end
    end
  end

  def juror?
    record.juror ? record.juror.user_id == user.id : contest.user_is_juror?(user)
  end
end
