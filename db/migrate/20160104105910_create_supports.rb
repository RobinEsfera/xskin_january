class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :page_name
      t.text :content
      t.text :extra
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
