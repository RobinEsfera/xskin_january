class ShippingController < ApplicationController
	def address_edit
		@shipping_address = ShippingAddress.where(:user_id => current_user.id).first
		if(@shipping_address)
			if @shipping_address.update(shipping_params)
				flash[:success] = "Record has been saved successfully!!"
			else
				flash[:error] = @shipping_address.errors.full_messages.join('<br>')
			end
		else
			@shipping_address = ShippingAddress.new(shipping_params)
			if @shipping_address.save
				flash[:success] = "Record has been saved successfully!!"
			else
				flash[:error] = @shipping_address.errors.full_messages.join('<br>')
			end
		end

		redirect_to "/users/edit"
	end

	private

	def shipping_params
		params.require(:shipping_address).permit(:first_name,:last_name,:address1,:address2,:country_id,:city,:state,:pincode,:mobile).merge(user_id: current_user.id)
	end
end
