class PagesController < ApplicationController
  def home
    @warriors_sample = []
    5.times do
      count = Warrior.count
      random_offset = rand(count)
      random_warrior = User.offset(random_offset).first
      @warriors_sample << random_warrior
    end
    @warriors_sample
  end
end
