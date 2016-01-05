class StampImage < ActiveRecord::Base
   belongs_to :stamp
   mount_uploader :image, StampImagesUploader
end
