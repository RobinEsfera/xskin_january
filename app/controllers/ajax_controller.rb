class AjaxController < ApplicationController
	def get_sub_device
		@sub_device = SubDevice.where(:device_id => params[:device_id])
		render :plain=>@sub_device.to_json
	end

	def get_store_sub_category
		@store_sub_category = StoreSubCategory.where(:store_category_id => params[:store_category_id])
		render :plain=>@store_sub_category.to_json
	end
end
