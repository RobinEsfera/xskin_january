class AddStoreCategoryToProductColor < ActiveRecord::Migration
  def change
  	add_reference :product_colors, :store_category, index: true, foreign_key: true
  end
end
