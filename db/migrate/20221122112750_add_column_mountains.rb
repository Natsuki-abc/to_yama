class AddColumnMountains < ActiveRecord::Migration[6.1]
  def change
    add_column :mountains, :furigana, :string
  end
end
