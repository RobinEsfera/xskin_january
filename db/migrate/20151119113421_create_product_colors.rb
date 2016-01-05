class CreateProductColors < ActiveRecord::Migration
  def change
    create_table :product_colors do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
