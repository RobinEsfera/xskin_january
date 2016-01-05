class CreateProductVariations < ActiveRecord::Migration
  def change
    create_table :product_variations do |t|
      t.string :image
       t.references :product, index: true, foreign_key: true
       t.references :product_color, index: true, foreign_key: true
       t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
