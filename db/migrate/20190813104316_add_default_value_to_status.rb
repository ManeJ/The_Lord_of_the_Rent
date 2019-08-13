class AddDefaultValueToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :status, :string, default: 'pending'
    #Ex:- :default =>''
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
