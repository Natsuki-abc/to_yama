class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :mountain_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
