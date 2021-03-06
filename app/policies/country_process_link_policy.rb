class CountryProcessLinkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      end
    end
  end

  def show?
    return true
  end

  def create?
    return true if user.admin?
  end

  def destroy?
    return true if user.admin?
  end
end
