class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.references :store_sub_category, index: true, foreign_key: true
      t.references :sub_device, index: true, foreign_key: true
      t.references :case, index: true, foreign_key: true
      t.references :layout, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true
      t.float :price
      t.string :description
      t.string :color
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
