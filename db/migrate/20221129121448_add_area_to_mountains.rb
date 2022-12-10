class AddAreaToMountains < ActiveRecord::Migration[6.1]
  def change
    add_column :mountains, :area, :string
  end
end
