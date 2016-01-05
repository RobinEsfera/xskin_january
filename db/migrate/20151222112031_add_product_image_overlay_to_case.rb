class AddProductImageOverlayToCase < ActiveRecord::Migration
  def change
    add_column :cases, :product_image_overlay, :string
  end
end
