class AddProductImageToCase < ActiveRecord::Migration
  def change
  	add_column :cases, :product_image, :string
  end
end
