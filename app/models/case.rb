class Case < ActiveRecord::Base
  mount_uploader :image, CaseImageUploader
  mount_uploader :product_image, CaseProductImageUploader
  mount_uploader :product_image_overlay, CaseProductImageOverlayUploader
	belongs_to :device
	belongs_to :sub_device
	has_and_belongs_to_many :layouts

  # attr_accessor :layout_list
  # after_save :update_layouts

  attr_accessor :layout_list
  before_save :update_layouts

  private 

  def update_layouts
    layouts.delete_all
    # puts "hello strat"
    # puts layout_list.to_s
    # # selected_layouts = layout_list.keys.collect{|id| Layout.find_by_id(id)}
    # # selected_layouts.each {|layout| self.layouts << layout}
  end
end
