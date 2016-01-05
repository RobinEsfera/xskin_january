class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.string :name
      t.string :image
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
