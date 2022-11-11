class DropRating < ActiveRecord::Migration[6.1]
  def change
    drop_table :rating_ratings do |t|
      t.decimal :average,  default: 0, mull: false, precision: 25, scale: 16
      t.decimal :estimate, default: 0, mull: false, precision: 25, scale: 16
      t.integer :sum,      default: 0, mull: false
      t.integer :total,    default: 0, mull: false

      t.references :resource,  index: true, null: false, polymorphic: true
      t.references :scopeable, index: true, null: true,  polymorphic: true

      t.timestamps null: false
    end

    drop_table :rating_rates do |t|
      t.decimal :value, default: 0, precision: 25, scale: 16

      t.references :author,    index: true, null: false, polymorphic: true
      t.references :resource,  index: true, null: false, polymorphic: true
      t.references :scopeable, index: true, null: true,  polymorphic: true

      t.timestamps null: false
    end
  end
end
