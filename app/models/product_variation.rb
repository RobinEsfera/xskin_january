class ProductVariation < ActiveRecord::Base
	belongs_to :product
	belongs_to :product_color
	mount_uploader :image, ProductImageUploader
end
