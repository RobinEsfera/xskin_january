class CaseType < ActiveRecord::Base
  mount_uploader :image, CaseImageUploader
  mount_uploader :product_image, CaseProductImageUploader
	belongs_to :case
end
