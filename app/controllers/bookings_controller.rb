class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @restricted_bookings = Booking.where(warrior_id: params[:warrior_id]).order(created_at: :desc)
    @warrior = Warrior.find(params[:warrior_id])
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

  def destroy
    @booking = current_user.bookings.find(params[:id])
    @booking.destroy
    redirect_to warriors_path
    authorize(@booking)
  end

  def display_resa
    @bookings = current_user.bookings
    authorize(@bookings)
  end

  def display_bookings
    @warriors = current_user.warriors
    authorize(@warriors)
  end

  def edit
    @booking = current_user.bookings.find(params[:id])
    @warrior = Warrior.find(@booking.warrior_id)
    authorize(@booking)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to warrior_booking_path(@booking)
    authorize(@booking)
  end

  def accept
    raise
    @booking = current_user.bookings.find(params[:id])
    @warrior = Warrior.find(@booking.warrior_id)
    redirect_to warriors_path
    authorize(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:place, :start_date, :end_date, :total_price, :status)
  end

  def price_calculator
    @warrior = Warrior.find(params[:warrior_id])
    @price = @warrior.price
    @days = (@booking.end_date - @booking.start_date).to_i + 1
    @total_price = @price * @days
    @booking.total_price = @total_price
  end
end
