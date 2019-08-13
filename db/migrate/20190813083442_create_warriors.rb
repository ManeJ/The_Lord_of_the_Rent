class CreateWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :warriors do |t|
      t.string :nickname
      t.string :specialty
      t.string :race
      t.string :weapon
      t.integer :price
      t.string :photo
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
