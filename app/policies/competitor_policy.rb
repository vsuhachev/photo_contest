class CompetitorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.competitors
    end
  end
end
