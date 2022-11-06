class CreateMountains < ActiveRecord::Migration[6.1]
  def change
    create_table :mountains do |t|
      t.string :mountain_name
      t.string :address
      t.string :time
      t.integer :elevation
      t.float :difficulty
      t.string :station
      t.string :season
      t.string :parking
      t.integer :distance
      t.string :yama_image
      t.timestamps
    end
  end
end
