class PageController < ApplicationController
	before_action :authenticate_user!, :except => [:home,:upload_image,:upload_image_remove,:store,:apple_watch,:iphone6,:make,:top_design,:demo,:faq,:privacy,:developer,:terms,:testimonial,:contact,:spotting,:careers,:newsletter_submit,:add_cart,:clear_cart,:cart,:gift,:store_category,:product,:get_product_from_color]
	def home
		
	end

	def angular_test

	end
	def demo
		@arrHomeSliders=HomeSlider.all
		@product_variation = ProductVariation.all.limit(2)
		# render :plain => @product.inspect
		# @data = File.read("#{Rails.root}/public/layout.json")
		# render :json => @data
	end
    def store_category
# render :plain => request.referrer.inspect
    	@arrDevice = Array.new
    	@arrCase = Array.new
    	@arrBrand = Array.new
    	@arrColor = Array.new
    	@price_min = !params[:price_min].nil? ? params[:price_min] : 500
    	@price_max = !params[:price_max].nil? ? params[:price_max] : 2000
# render :plain => @price_min.to_json    	
    	if(params[:device])
    		@arrDevice = params[:device].split(",").map(&:to_i).uniq
    	end
    	if(params[:case])
    		@arrCase = params[:case].split(",").map(&:to_i).uniq
    	end
    	if(params[:brand])
    		@arrBrand = params[:brand].split(",").map(&:to_i).uniq
    	end
    	if(params[:color])
    		@arrColor = params[:color].split(",").map(&:to_i).uniq
    	end
 	
	 	conditions = String.new
	    wheres = Array.new
	 
	 	if (params[:category])
		 	conditions << "store_sub_category_id = (?)"
		 	wheres << params[:category]
		else
		 	conditions << "store_category_id = (?)"
		 	wheres << params[:cat]
		end

	 	conditions << " AND price > (?)"
	 	wheres << @price_min

	 	conditions << " AND price < (?)"
	 	wheres << @price_max

	    if params.has_key?(:device)
	      conditions << " AND " unless conditions.length == 0
	      conditions << "device_id IN (?)"
	      wheres << @arrDevice
	    end
	    if params.has_key?(:case)
	      conditions << " AND " unless conditions.length == 0
	      conditions << "case_id IN (?)"
	      wheres << @arrCase
	    end
	    if params.has_key?(:brand)
	      conditions << " AND " unless conditions.length == 0
	      conditions << "brand_id IN (?)"
	      wheres << @arrBrand
	    end
	 
	    wheres.insert(0, conditions)

    	@product = Product.where(wheres)					

    	@device = Device.all
    	@caseData = Case.all

	 	if (params[:category])
	    	@color = ProductColor.where(:store_sub_category_id => params[:category])
	    	@brand = Brand.where(:store_sub_category_id => params[:category])
	    else
	    	@color = ProductColor.where(:store_category_id => params[:cat])
	    	@brand = Brand.where(:store_category_id => params[:cat])
	    end
    		    	
    end
	def store
		
	end
	def apple_watch
		
	end
	def iphone6
		
	end
	def make
		
		@make_devices=Device.all
       	@sub_device_id = params[:device]
       	if !params[:device]
           	@sub_device_id = SubDevice.first.id.to_s
       	end
       	@sub_device=SubDevice.find(@sub_device_id)
       	@device_id=@sub_device.device_id
       	@cases=Case.where(:sub_device_id=>@sub_device_id)
		@case_first=Case.where(:sub_device_id=>@sub_device_id).first

        @layouts = Array.new
        if !@case_first.nil?
			@layouts = Layout.includes(:cases).where(cases: { id: @case_first.id })
		end
	end
	def gallery
		
	end
	def invite
		
	end
	def promotion
		
	end
	def top_design
		
	end
	def testimonial
		@support = Support.where(:page_name => params[:action]).first
		
	end
	def affiliate
		
	end
	def add_cart
		id = params[:id]
		quantity = params[:quantity]
		# if the cart has already been created, use existing cart else create a new cart
		if session[:cart]
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end

		# if the product has already been added to the cart, increment the value else set it
		if quantity
			cart[id] = quantity.to_i
		else
			if cart[id]
				cart[id] = cart[id] + 1
			else
				cart[id] = 1
			end
		end

	  flash[:success]="Your cart has been updated Sucessfully."
	  respond_to do |format|
	  	format.html { redirect_to :action => "cart" }
	  	format.js   { render :plain => cart.to_json }
	  end
		# redirect_to :action => :cart
		# redirect_to request.referrer
	end
	def clear_cart		
		id = params[:id]
		if(id)
			session[:cart].delete(params[:id])
		else
			session[:cart] = nil
		end

	    flash[:success]="Your cart has been updated Sucessfully."
		redirect_to :action => :cart
	end
	def cart
		if session[:cart]
			@cart = session[:cart]
		else
			@cart = {}
		end
	end
	def wishlist
		@wishlist = Wishlist.where(:user_id => current_user.id)
	end
	def clear_wishlist		
		id = params[:id]
		if(id)
			@wishlist = Wishlist.where(:id => id, :user_id => current_user.id).destroy_all
		else
			@wishlist = Wishlist.where(:user_id => current_user.id).destroy_all
		end

	    flash[:success]="Your wishlist has been updated Sucessfully."
		redirect_to :action => :wishlist
	end
	def add_wishlist		
		id = params[:id]
		if(id)
			@product_variation = ProductVariation.where(:id => id).first
			@wishlist = Wishlist.new(:user_id => current_user.id, :product_id => @product_variation.product_id, :product_variation_id => id)
			@wishlist.save
		end

	  flash[:success]="Your wishlist has been updated Sucessfully."
	  respond_to do |format|
	  	format.html { redirect_to :action => "wishlist" }
	  	format.js   { render :plain => wishlist.to_json }
	  end
	end
	def checkout_shipping
		@shipping_address = ShippingAddress.where(:user_id => current_user.id).first
		@billing_address = BillingAddress.where(:user_id => current_user.id).first
	end
	def payment
		# render :plain => session.to_json
	end
	def get_billing_address
		@billing_address = BillingAddress.where(:user_id => current_user.id).first
		render :plain => @billing_address.to_json

	end
	def get_shipping_address
		@shipping_address = ShippingAddress.where(:user_id => current_user.id).first
		render :plain => @shipping_address.to_json
	end
	def checkout_shipping_submit
		# render :plain => params.to_json
		session[:shipping] = {:shipping_first_name => params[:checkout][:shipping_first_name],:shipping_last_name => params[:checkout][:shipping_last_name],:shipping_address => params[:checkout][:shipping_address],:shipping_city => params[:checkout][:shipping_city],:shipping_state => params[:checkout][:shipping_state],:shipping_pincode => params[:checkout][:shipping_pincode],:shipping_mobile => params[:checkout][:shipping_mobile]}

		if(params[:billing_check])
			session[:billing] = {:shipping_first_name => params[:checkout][:shipping_first_name],:shipping_last_name => params[:checkout][:shipping_last_name],:shipping_address => params[:checkout][:shipping_address],:shipping_city => params[:checkout][:shipping_city],:shipping_state => params[:checkout][:shipping_state],:shipping_pincode => params[:checkout][:shipping_pincode],:shipping_mobile => params[:checkout][:shipping_mobile]}
		else
			session[:billing] = {:billing_first_name => params[:checkout][:billing_first_name],:billing_last_name => params[:checkout][:billing_last_name],:billing_address => params[:checkout][:billing_address],:billing_city => params[:checkout][:billing_city],:billing_state => params[:checkout][:billing_state],:billing_pincode => params[:checkout][:billing_pincode],:billing_mobile => params[:checkout][:billing_mobile]}
		end
		
		redirect_to :action => "payment"
	end
	def billing_address
		
		@billing=BillingAddress.where(:user_id=>current_user.id)
		if !@billing.blank?
			@billing.update_all(billing_params)
			flash[:success]="Billing Address updated Sucessfully."
		else
			bill=BillingAddress.new(billing_params)
			bill.save
			flash[:success]="Billing Address inserted Sucessfully."
		end

		redirect_to edit_user_registration_path

	end
	def select_currency
		if params[:selected_currency]
			cookies[:currency] = {
				   :value => params[:selected_currency],
				   :expires => 1.year.from_now
				 }
			flash[:success]="Sucessfully selected the currency.";
			redirect_to request.referrer
		else
			flash[:error]="Please select currency";
			redirect_to request.referrer
		end
	end
	def privacy
		@support = Support.where(:page_name => params[:action]).first
		
	end
	def developer
		
	end
	def careers
		@support = Support.where(:page_name => params[:action]).first
		
	end
	def terms
		@support = Support.where(:page_name => params[:action]).first

	end
	def faq
		@faqs_cat=FaqCategory.where(:is_active=>true)

	end
	def contact
		@support = Support.where(:page_name => params[:action]).first
		# render :plain => @content.inspect
	end
	def spotting
		
	end
	def gift
		
	end
	def product
		if (params[:product])
    		@product_variation = ProductVariation.where(:id => params[:product]).first
    		@product_color = ProductColor.where(:id => @product_variation.product_color_id).first
    		@product = Product.find(@product_variation.product_id)
    		@store_sub_category = StoreSubCategory.find(@product.store_sub_category_id)
    		# @sub_device = SubDevice.where(:device_id => @product.device_id).map{|u| [ u.name, u.id ] }
    		@sub_device = SubDevice.where(:device_id => @product.device_id).first
    		@color = ProductColor.where(:store_sub_category_id => @product.store_sub_category_id)
    		# render :plain => @product_variation.inspect
    	end
	end

	def get_product_from_color		
		@product_variation = ProductVariation.where(:product_color_id => params[:color_id]).first
		render :plain => @product_variation.to_json
	end

	def get_cases_from_id		
		@layouts = Layout.includes(:cases).where(cases: { id: params[:case_id] })
	
		# @cases = Case.where(:id => params[:case_id])
		render :plain => @layouts.to_json
	end
	def upload_image		
		uploaded_io = params[:file]
	    File.open(Rails.root.join('public/uploads', 'cookie_upload', uploaded_io.original_filename), 'wb') do |file|
	      file.write(uploaded_io.read)
	    end

	    if (cookies[:image_upload])
	      val_hash = uploaded_io.original_filename + ", " + cookies[:image_upload]
	    else
	      val_hash = uploaded_io.original_filename
	    end
	    cookies[:image_upload] = { :value => val_hash, :expires => Time.now + 3600}
	    render :plain => uploaded_io.original_filename.inspect
	end
	def upload_image_remove
		image_name = params[:image_name]

		@cookie_images = cookies[:image_upload].split(", ").map(&:to_s)

		@intersection = @cookie_images.delete(image_name)
        val_hash = @cookie_images.join(", ")
		# # @result = array_diff(@user_friends, params['contactIds'])

	    cookies[:image_upload] = { :value => val_hash, :expires => Time.now + 3600}
	    render :plain => @cookie_images.inspect
	end

	def send_email
		
		@user=current_user
		UserMailer.welcome_email(@user).deliver unless @user.invalid?
	end

	def newsletter_submit
		@newsletter=Newsletter.new(newsletter_params)
		if @newsletter.save
			flash[:success]="Welcome you are subscribed."
			redirect_to demo_path
		else
				flash[:error]=@newsletter.errors.full_messages.join('<br>')
				# flash[:error]="hello"
				redirect_to demo_path
			end
	end


	private

	def newsletter_params
		params.require(:newsletter).permit(:email)		
	end
	def billing_params
		params.require(:billing_address).permit(:first_name,:last_name,:address,:country_id,:state,:city,:pincode,:mobile,:user_id)		
	end
end
