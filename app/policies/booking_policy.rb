class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def display?
    return true
  end

  def new?
    true
  end

  def create?
    true
  end
end
