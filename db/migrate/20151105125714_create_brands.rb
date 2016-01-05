class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.references :store_sub_category, foreign_key: true
      t.references :sub_device, foreign_key: true
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
