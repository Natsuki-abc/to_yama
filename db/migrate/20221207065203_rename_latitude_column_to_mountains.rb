class RenameLatitudeColumnToMountains < ActiveRecord::Migration[6.1]
  def change
    rename_column :mountains, :Latitude, :latitude
    rename_column :mountains, :Longitude, :longitude
  end
end
