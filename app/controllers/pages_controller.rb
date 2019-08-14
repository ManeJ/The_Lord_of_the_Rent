class PagesController < ApplicationController
  def home
    sample = []
    6.times do
      count = Warrior.count
      random_offset = rand(count)
      random_warrior = Warrior.offset(random_offset).first
      sample << random_warrior
    end
    @warriors_sample = sample.uniq
  end
end
