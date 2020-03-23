class DryingProcessPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      end
    end
  end

  def create?
    return true if user.admin?
  end
end
