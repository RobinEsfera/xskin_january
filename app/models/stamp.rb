class Stamp < ActiveRecord::Base
	has_many :stamp_images, :dependent => :destroy
	mount_uploader :image, StampCoverUploader
end
