class VarietyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.all
      end
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    return true if user.admin?
  end

  def update?
    return true if user.admin?
  end

  def destroy?
    return true if user.admin?
  end
end
