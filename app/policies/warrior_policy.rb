class WarriorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def new?
    true
  end

  def owner?
    return true
  end

  def show?
    return true
  end


end
