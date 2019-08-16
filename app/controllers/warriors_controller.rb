class WarriorsController < ApplicationController
  before_action :set_warrior, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, :only => :index

  def index
    @warriors = policy_scope(Warrior).order(created_at: :desc)
    @geo_warriors = Warrior.geocoded
    @markers = @warriors.map do |warrior|
      {
        lat: warrior.latitude,
        lng: warrior.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { warrior: warrior }),
        image_url: helpers.asset_url('skull-color.png')
      }
    end
  end

  def show
  end

  def new
    @warrior = Warrior.new
    authorize(@warrior)
  end

  def create
    @user = current_user
    @warrior = Warrior.new(warrior_params)
    @warrior.user = @user
    if @warrior.save
      redirect_to warrior_path(@warrior)
    else
      render :new
    end
    authorize(@warrior)
  end


  def edit
  end

  def update
    @warrior.update(warrior_params)

    redirect_to warrior_path(@warrior)
  end

  def destroy
    @warrior.destroy

    redirect_to warriors_path
  end

  def owner
    @warriors = current_user.warriors
    authorize(@warriors)
  end


  private

  def set_warrior
    @warrior = Warrior.find(params[:id])
    authorize(@warrior)
  end

  def warrior_params
    params.require(:warrior).permit(:nickname, :address, :specialty, :race, :weapon, :price, :photo)
  end

end
