class MakeMobilePage < ActiveRecord::Base
	mount_uploader :app_icon, MakeMobileIconUploader
	mount_uploader :background, MakeMobileBackgroundUploader
end
