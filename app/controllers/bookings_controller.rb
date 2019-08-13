class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @warrior = Warrior.find(params[:warrior_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @warrior = @user.warriors.find(params[:warrior_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.warrior_id = @warrior.id
    if @booking.save
      redirect_to warrior_booking_path(@warrior, @booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def delete
  end

  private

  def booking_params
    params.require(:booking).permit(:place, :start_date, :end_date, :total_price)
  end

end
