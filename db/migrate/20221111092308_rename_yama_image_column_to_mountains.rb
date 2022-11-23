class RenameYamaImageColumnToMountains < ActiveRecord::Migration[6.1]
  def change
    rename_column :mountains, :yama_image, :mountain_image
  end
end
