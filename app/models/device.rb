class Device < ActiveRecord::Base
  mount_uploader :device_image, DeviceImageUploader
	has_many :sub_devices
end
