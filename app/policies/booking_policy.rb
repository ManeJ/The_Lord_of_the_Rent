class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def display_resa?
    return true
  end

  def display_bookings?
    return true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def show?
    true
  end

  def total_price?
    true
  end

  def destroy?
    true
  end




end
