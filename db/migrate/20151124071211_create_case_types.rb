class CreateCaseTypes < ActiveRecord::Migration
  def change
    create_table :case_types do |t|
       t.references :case, index: true, foreign_key: true
       t.string :name
       t.string :image
       t.string :product_image
       t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
