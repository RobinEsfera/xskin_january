class HomeSlider < ActiveRecord::Base
  mount_uploader :image, HomeSliderUploader
end
