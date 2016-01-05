class AddStoreCategoryToBrand < ActiveRecord::Migration
  def change
  	add_reference :brands, :store_category, index: true, foreign_key: true
  end
end
