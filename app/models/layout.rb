class Layout < ActiveRecord::Base
  mount_uploader :image, LayoutImageUploader
  belongs_to :device
	has_and_belongs_to_many :cases
end
