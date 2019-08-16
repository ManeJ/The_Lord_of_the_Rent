class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => :home

  def home
    if Warrior.count <= 3
      @warriors_sample = Warrior.all
    else
      @warriors_sample = Warrior.order(id: :desc).last(3)
    end
    @sample
    # METHODE POUR RANDOM
    # 6.times do
    #   count = Warrior.count
    #   random_offset = rand(count)
    #   random_warrior = Warrior.offset(random_offset).first
    #   sample << random_warrior
    # end
    # @warriors_sample = sample.uniq
  end
end
