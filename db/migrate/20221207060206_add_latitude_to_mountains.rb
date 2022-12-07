class AddLatitudeToMountains < ActiveRecord::Migration[6.1]
  def change
    add_column :mountains, :Latitude, :float
    add_column :mountains, :Longitude, :float
  end
end
