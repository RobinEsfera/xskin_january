class SubDevice < ActiveRecord::Base
	belongs_to :device
	has_many :cases
  mount_uploader :sub_device_image, SubDeviceImageUploader
end
