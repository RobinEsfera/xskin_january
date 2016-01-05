class AddStoreCategoryToProduct < ActiveRecord::Migration
  def change
  	add_reference :products, :store_category, index: true, foreign_key: true
  end
end
