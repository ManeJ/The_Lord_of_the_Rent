class AddCoordinatesToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :latitude, :float
    add_column :warriors, :longitude, :float
  end
end
