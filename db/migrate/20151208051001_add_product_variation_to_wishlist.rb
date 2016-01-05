class AddProductVariationToWishlist < ActiveRecord::Migration
  def change
  	add_reference :wishlists, :product_variation, index: true, foreign_key: true

  end
end
