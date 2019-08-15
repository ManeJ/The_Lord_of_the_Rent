class BookingsController < ApplicationController
  def index
  end

  def new
    @warrior = Warrior.find(params[:warrior_id])
    @booking = Booking.new
    authorize(@warrior)
  end

  def create
    @user = current_user
    @warrior = Warrior.find(params[:warrior_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.warrior_id = @warrior.id
    price_calculator
    if @booking.save
      redirect_to warrior_booking_path(@warrior, @booking)
    else
      render :new
    end
    authorize(@warrior)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize(@booking)
  end

  def delete
    @booking.destroy

    redirect_to warriors_path
  end

  def display
    @bookings = current_user.bookings
    authorize(@bookings)
  end

  def edit
    @booking = Booking.find(params[:id])
    @warrior = current_user.warriors.find(params[:warrior_id])
    authorize(@booking)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to warrior_booking_path(@booking)
    authorize(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:place, :start_date, :end_date, :total_price)
  end

  def price_calculator
    @warrior = Warrior.find(params[:warrior_id])
    @price =  @warrior.price
    @days = (@booking.start_date - @booking.end_date).to_i
    @total_price = @price * @days
    @booking.total_price = @total_price
  end

end
