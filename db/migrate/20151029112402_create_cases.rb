class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.references :sub_device, index: true, foreign_key: true
      t.string :image
      t.text :description
      t.string :layout_id
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
