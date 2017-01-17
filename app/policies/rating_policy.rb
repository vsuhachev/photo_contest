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
    contest.jurors.where(user_id: user).exists?
  end
end
