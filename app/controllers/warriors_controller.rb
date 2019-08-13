class WarriorsController < ApplicationController
  before_action :set_warrior, only: [:show, :edit, :update, :destroy]

  def index
    @warriors = Warrior.all
  end

  def show
  end

  def new
    @warrior = Warrior.new
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
  end


  private

  def set_warrior
    @warrior = Warrior.find(params[:id])
  end

  def warrior_params
    params.require(:warrior).permit(:nickname, :address, :specialty, :race, :weapon, :price, :photo)
  end

end
