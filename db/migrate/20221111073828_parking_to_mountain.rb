class ParkingToMountain < ActiveRecord::Migration[6.1]
  def change
    change_column :mountains, :difficulty, :integer
    change_column :mountains, :parking, :text
  end
end
