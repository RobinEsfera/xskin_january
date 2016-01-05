class BackendController < ApplicationController
  # before_action :authenticate_user!,  redirect_to "/admin/login"
  before_filter :auth_user

  def auth_user

    if user_signed_in?
      unless current_user.try(:admin?)
      redirect_to "/admin/login"
      end
    else
      redirect_to "/admin/login"
    end

    # flash[:error] = "You are not an admin, Please login as a admin"
    # redirect_to "/admin/login" unless user_signed_in?
  end

	layout "backend"
  def index

  end
  def user
    @users = User.all.order('id DESC')
    render :template => "backend/User/user"
  end

  def show_user
    id = params[:id]
    @user = User.where(:id=>id).first
    render :template => "backend/User/show_user"
  end

  def add_user
    @user = User.new
    if request.post?
      @user = User.new(user_params)
      if @user.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "user"
      else
        flash[:error]="Record doesn't saved."
        render :add_user
      end
    else      
      render :template => "backend/User/add_user"
    end
  end

  def edit_user
    id = params[:id]
    @user = User.where(:id=>id).first

    if !@user.nil?
      if request.post?
        # render :plain => params.inspect
        if @user.update(:name => params[:user][:name],:email => params[:user][:email],:provider => params[:user][:provider],:referral_code => params[:user][:referral_code],:affiliate_id => params[:user][:affiliate_id],:admin => params[:user][:admin])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "user"
        else
          flash[:error]="Record doesn't updated."
          render :edit_user
        end
      else        
        render :template => "backend/User/edit_user"
      end
    else      
      flash[:error]="User with id '#{id}' could not be found"
      redirect_to :action => "user"     
    end
  end

  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "user"
  end

                        # DEVICE Table methods
  def device
  	# @devices ||= fetch_devices
  	@devices = Device.all.order('id DESC')
    render :template => "backend/Device/device"
  	# render :plain => @devices.inspect
  end

  def show_device
  	id = params[:id]
    @device = Device.where(:id=>id).first
    render :template => "backend/Device/show_device"

  end

  def add_device
    @device = Device.new
    if request.post?
    	# render :plain => params.inspect
  	  @device = Device.new(device_params)
  	  if @device.save
  	  	flash[:success]="Record has been saved Sucessfully."
  	    redirect_to :action => "device"
  	  else
  	  	flash[:error]="Record doesn't saved."
  	    render :add_device
  	  end
    else
      render :template => "backend/Device/add_device"
    end
  end

  def edit_device
  	id = params[:id]
    @device = Device.where(:id=>id).first

    if !@device.nil?
	    if request.post?
	    	# render :plain => params.inspect
  		  if @device.update(:name => params[:device][:name], :device_image => params[:device][:device_image])
  		  	flash[:success]="Record has been updated Sucessfully."
  		    redirect_to :action => "device"
  		  else
  		  	flash[:error]="Record doesn't updated."
  		    render :edit_device
  		  end
      else
        render :template => "backend/Device/edit_device"
	    end

    else    	
	  	flash[:error]="Device with id '#{id}' could not be found"
	    redirect_to :action => "device"	    
    end

    # render :plain => params.inspect
  end

  def delete_device
  	# render :plain => params.inspect
  	@device = Device.find(params[:id])
    @device.destroy
	flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "device"
  end

            # Brand Table Methods

  def brand
    @brands = Brand.all.order('id DESC')
    render :template => "backend/Brand/brand"
  end

  def show_brand
    id = params[:id]
    @brand = Brand.where(:id=>id).first
    render :template => "backend/Brand/show_brand"
  end

  def add_brand
    @brand = Brand.new
    if request.post?
      @brand = Brand.new(brand_params)
      if @brand.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "brand"
      else
        flash[:error]="Record doesn't saved."
        render :add_brand
      end
    else
      render :template => "backend/Brand/add_brand"
    end
  end

  def edit_brand
    id = params[:id]
    @brand = Brand.where(:id=>id).first

    if !@brand.nil?
      if request.post?
        # render :plain => params.inspect

        if @brand.update(:name => params[:brand][:name],:store_category_id => params[:brand][:store_category_id],:store_sub_category_id => params[:brand][:store_sub_category_id],:sub_device_id => params[:brand][:sub_device_id],:is_active => params[:brand][:is_active])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "brand"
        else
          flash[:error]="Record doesn't updated."
          render :edit_brand
        end
      else
        render :template => "backend/Brand/edit_brand"
      end
    else      
      flash[:error]="Brand with id '#{id}' could not be found"
      redirect_to :action => "brand"     
    end
  end

  def delete_brand
    @brand = Brand.find(params[:id])
    @brand.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "brand"
  end
            # Billing Address Table Methods

  def billing_address
    @billing_addresses = BillingAddress.all.order('id DESC')
    render :template => "backend/BillingAddress/billing_address"
  end

  def show_billing_address
    id = params[:id]
    @billing_address = BillingAddress.where(:id=>id).first
    render :template => "backend/BillingAddress/show_billing_address"
  end

  def add_billing_address
    @billing_address = BillingAddress.new
    if request.post?
      @billing_address = BillingAddress.new(billing_address_params)
      if @billing_address.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "billing_address"
      else
        flash[:error]="Record doesn't saved."
        render :add_billing_address
      end
    else
      render :template => "backend/BillingAddress/add_billing_address"
    end
  end

  def edit_billing_address
    id = params[:id]
    @billing_address = BillingAddress.where(:id=>id).first

    if !@billing_address.nil?
      if request.post?
        # render :plain => params.inspect,:user_id

        if @billing_address.update(:first_name => params[:billing_address][:first_name],:last_name => params[:billing_address][:last_name],:address => params[:billing_address][:address],:country_id => params[:billing_address][:country_id],:city => params[:billing_address][:city],:state => params[:billing_address][:state],:pincode => params[:billing_address][:pincode],:mobile => params[:billing_address][:mobile],:user_id => params[:billing_address][:user_id])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "billing_address"
        else
          flash[:error]="Record doesn't updated."
          render :edit_billing_address
        end
      else
        render :template => "backend/BillingAddress/edit_billing_address"
      end
    else      
      flash[:error]="BillingAddress with id '#{id}' could not be found"
      redirect_to :action => "billing_address"     
    end
  end

  def delete_billing_address
    @billing_address = BillingAddress.find(params[:id])
    @billing_address.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "billing_address"
  end
            # Case Table Methods
  def get_all_layouts  
    @layouts = Layout.all
  end  

  def case
    @cases = Case.all.order('id DESC')
    render :template => "backend/Case/case"
  end

  def show_case
    id = params[:id]
    @case = Case.where(:id=>id).first
    render :template => "backend/Case/show_case"
  end

  def add_case
    get_all_layouts
    @case = Case.new
    if request.post?
      @case = Case.new(case_params)
      if @case.save

          if(params[:case][:layout_list])
            params[:case][:layout_list].each do |key,value|
              layout = Layout.find(key)
              @case.layouts << layout
            end
          end
          
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "case"
      else
        flash[:error]="Record doesn't saved."
        render :add_case
      end
      else
        render :template => "backend/Case/add_case"
    end
  end

  def edit_case
    params[:layouts] ||= {}
    id = params[:id]
    @case = Case.where(:id=>id).first
    get_all_layouts


    if !@case.nil?
      if request.post?

        # render :plain => params.inspect
        # if @case.update(case_params)
        if @case.update(:name => params[:case][:name],:sub_device_id => params[:case][:sub_device_id],:image => params[:case][:image],:description => params[:case][:description],:long_description => params[:case][:long_description],:device_id => params[:case][:device_id],:is_active => params[:case][:is_active])

          if(params[:case][:layout_list])
            params[:case][:layout_list].each do |key,value|
              layout = Layout.find(key)
              @case.layouts << layout
            end
          end

          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "case"
        else
          flash[:error]="Record doesn't updated."
          render :edit_case
        end
      else
        render :template => "backend/Case/edit_case"
      end
    else      
      flash[:error]="Case with id '#{id}' could not be found"
      redirect_to :action => "case"     
    end
  end

  def delete_case
    @case = Case.find(params[:id])
    @case.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "case"
  end
            # CaseType Table Methods

  def case_type
    @case_types = CaseType.all.order('id DESC')
    render :template => "backend/CaseType/case_type"
  end

  def show_case_type
    id = params[:id]
    @case_type = CaseType.where(:id=>id).first
    render :template => "backend/CaseType/show_case_type"
  end

  def add_case_type
    @case_type = CaseType.new
    if request.post?
      @case_type = CaseType.new(case_type_params)
      if @case_type.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "case_type"
      else
        flash[:error]="Record doesn't saved."
        render :add_case_type
      end
    else
      render :template => "backend/CaseType/add_case_type"
    end
  end

  def edit_case_type
    id = params[:id]
    @case_type = CaseType.where(:id=>id).first

    if !@case_type.nil?
      if request.post?
        # render :plain => params.inspect
        if @case_type.update(:name => params[:case_type][:name],:case_id => params[:case_type][:case_id],:image => params[:case_type][:image],:active => params[:case_type][:active])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "case_type"
        else
          flash[:error]="Record doesn't updated."
          render :edit_case_type
        end
      else  
        render :template => "backend/CaseType/edit_case_type"
      end
    else      
      flash[:error]="CaseType with id '#{id}' could not be found"
      redirect_to :action => "case_type"     
    end
  end

  def delete_case_type
    @case_type = CaseType.find(params[:id])
    @case_type.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "case_type"
  end
            # Country Table Methods

  def country
    @countries = Country.all.order('id DESC')
    render :template => "backend/Country/country"
  end

  def show_country
    id = params[:id]
    @country = Country.where(:id=>id).first
    render :template => "backend/Country/show_country"
  end

  def add_country
    @country = Country.new
    if request.post?
      @country = Country.new(country_params)
      if @country.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "country"
      else
        flash[:error]="Record doesn't saved."
        render :add_country
      end
    else
      render :template => "backend/Country/add_country"
    end
  end

  def edit_country
    id = params[:id]
    @country = Country.where(:id=>id).first

    if !@country.nil?
      if request.post?
        # render :plain => params.inspect
        if @country.update(:name => params[:country][:name],:code => params[:country][:code])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "country"
        else
          flash[:error]="Record doesn't updated."
          render :edit_country
        end
        else
          render :template => "backend/Country/edit_country"
      end
    else      
      flash[:error]="Country with id '#{id}' could not be found"
      redirect_to :action => "country"     
    end
  end

  def delete_country
    @country = Country.find(params[:id])
    @country.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "country"
  end
            # Currency Table Methods

  def currency
    @currencies = Currency.all.order('id DESC')
    render :template => "backend/Currency/currency"
  end

  def show_currency
    id = params[:id]
    @currency = Currency.where(:id=>id).first
    render :template => "backend/Currency/show_currency"
  end

  def add_currency
    @currency = Currency.new
    if request.post?
      @currency = Currency.new(currency_params)
      if @currency.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "currency"
      else
        flash[:error]="Record doesn't saved."
        render :add_currency
      end
      else
        render :template => "backend/Currency/add_currency"
    end
  end

  def edit_currency
    id = params[:id]
    @currency = Currency.where(:id=>id).first

    if !@currency.nil?
      if request.post?
        # render :plain => params.inspect
        if @currency.update(:name => params[:currency][:name])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "currency"
        else
          flash[:error]="Record doesn't updated."
          render :edit_currency
        end
        else
          render :template => "backend/Currency/edit_currency"
      end
    else      
      flash[:error]="Currency with id '#{id}' could not be found"
      redirect_to :action => "currency"     
    end
  end

  def delete_currency
    @currency = Currency.find(params[:id])
    @currency.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "currency"
  end
            # Faq Table Methods

  def faq
    @faqs = Faq.all.order('id DESC')
    render :template => "backend/Faq/faq"
  end

  def show_faq
    id = params[:id]
    @faq = Faq.where(:id=>id).first
    render :template => "backend/Faq/show_faq"
  end

  def add_faq
    @faq = Faq.new
    if request.post?
      @faq = Faq.new(faq_params)
      if @faq.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "faq"
      else
        flash[:error]="Record doesn't saved."
        render :add_faq
      end
      else
        render :template => "backend/Faq/add_faq"
    end
  end

  def edit_faq
    id = params[:id]
    @faq = Faq.where(:id=>id).first

    if !@faq.nil?
      if request.post?
        # render :plain => params.inspect
        if @faq.update(:faq_category_id => params[:faq][:faq_category_id],:question => params[:faq][:question],:answer => params[:faq][:answer],:is_active => params[:faq][:is_active])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "faq"
        else
          flash[:error]="Record doesn't updated."
          render :edit_faq
        end
        else
          render :template => "backend/Faq/edit_faq"
      end
    else      
      flash[:error]="Faq with id '#{id}' could not be found"
      redirect_to :action => "faq"     
    end
  end

  def delete_faq
    @faq = Faq.find(params[:id])
    @faq.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "faq"
  end
            # Faq Categories Table Methods

  def faq_category
    @faq_categories = FaqCategory.all.order('id DESC')
        render :template => "backend/FaqCategory/faq_category"
  end

  def show_faq_category
    id = params[:id]
    @faq_category = FaqCategory.where(:id=>id).first
    render :template => "backend/FaqCategory/show_faq_category"
  end

  def add_faq_category
    @faq_category = FaqCategory.new
    if request.post?
      @faq_category = FaqCategory.new(faq_category_params)
      if @faq_category.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "faq_category"
      else
        flash[:error]="Record doesn't saved."
        render :add_faq_category
      end
      else
        render :template => "backend/FaqCategory/add_faq_category"
    end
  end

  def edit_faq_category
    id = params[:id]
    @faq_category = FaqCategory.where(:id=>id).first

    if !@faq_category.nil?
      if request.post?
        # render :plain => params.inspect
        if @faq_category.update(:name => params[:faq_category][:name],:is_active => params[:faq_category][:is_active])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "faq_category"
        else
          flash[:error]="Record doesn't updated."
          render :edit_faq_category
        end
        else
          render :template => "backend/FaqCategory/edit_faq_category"
      end
    else      
      flash[:error]="FaqCategory with id '#{id}' could not be found"
      redirect_to :action => "faq_category"     
    end
  end

  def delete_faq_category
    @faq_category = FaqCategory.find(params[:id])
    @faq_category.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "faq_category"
  end
            # Home Sliders Table Methods

  def home_slider
    @home_sliders = HomeSlider.all.order('id DESC')
        render :template => "backend/HomeSlider/home_slider"
  end

  def show_home_slider
    id = params[:id]
    @home_slider = HomeSlider.where(:id=>id).first
    render :template => "backend/HomeSlider/show_home_slider"
  end

  def add_home_slider
    @home_slider = HomeSlider.new
    if request.post?
      @home_slider = HomeSlider.new(home_slider_params)
      if @home_slider.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "home_slider"
      else
        flash[:error]="Record doesn't saved."
        render :add_home_slider
      end
      else
        render :template => "backend/HomeSlider/add_home_slider"
    end
  end

  def edit_home_slider
    id = params[:id]
    @home_slider = HomeSlider.where(:id=>id).first

    if !@home_slider.nil?
      if request.post?
        # render :plain => params.inspect
        if @home_slider.update(:title => params[:home_slider][:title],:subtitle => params[:home_slider][:subtitle],:image => params[:home_slider][:image],:link => params[:home_slider][:link])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "home_slider"
        else
          flash[:error]="Record doesn't updated."
          render :edit_home_slider
        end
        else
          render :template => "backend/HomeSlider/edit_home_slider"
      end
    else      
      flash[:error]="HomeSlider with id '#{id}' could not be found"
      redirect_to :action => "home_slider"     
    end
  end

  def delete_home_slider
    @home_slider = HomeSlider.find(params[:id])
    @home_slider.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "home_slider"
  end
            # Layout Table Methods

  def layout
    @layouts = Layout.all.order('id DESC')
        render :template => "backend/Layout/layout"
  end

  def show_layout
    id = params[:id]
    @layout = Layout.where(:id=>id).first
    render :template => "backend/Layout/show_layout"
  end

  def add_layout
    @layout = Layout.new
    if request.post?
      @layout = Layout.new(layout_params)
      if @layout.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "layout"
      else
        flash[:error]="Record doesn't saved."
        render :add_layout
      end
      else
        render :template => "backend/Layout/add_layout"
    end
  end

  def edit_layout
    id = params[:id]
    @layout = Layout.where(:id=>id).first

    if !@layout.nil?
      if request.post?
        # render :plain => params.inspect
        if @layout.update(:name => params[:layout][:name],:device_id => params[:layout][:device_id],:image => params[:layout][:image],:is_active => params[:layout][:is_active])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "layout"
        else
          flash[:error]="Record doesn't updated."
          render :edit_layout
        end
        else
          render :template => "backend/Layout/edit_layout"
      end
    else      
      flash[:error]="Layout with id '#{id}' could not be found"
      redirect_to :action => "layout"     
    end
  end

  def delete_layout
    @layout = Layout.find(params[:id])
    @layout.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "layout"
  end
            # MakeMobilePage Table Methods

  def make_mobile_page
    @make_mobile_pages = MakeMobilePage.all.order('id DESC')
    render :template => "backend/MakeMobilePage/make_mobile_page"
  end

  def show_make_mobile_page
    id = params[:id]
    @make_mobile_page = MakeMobilePage.where(:id=>id).first
    render :template => "backend/MakeMobilePage/show_make_mobile_page"
  end

  def add_make_mobile_page
    @make_mobile_page = MakeMobilePage.new
    if request.post?
      @make_mobile_page = MakeMobilePage.new(make_mobile_page_params)
      if @make_mobile_page.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "make_mobile_page"
      else
        flash[:error]="Record doesn't saved."
        render :add_make_mobile_page
      end
    else
      render :template => "backend/MakeMobilePage/add_make_mobile_page"
    end
  end

  def edit_make_mobile_page
    id = params[:id]
    @make_mobile_page = MakeMobilePage.where(:id=>id).first

    if !@make_mobile_page.nil?
      if request.post?
        # render :plain => params.inspect

        if @make_mobile_page.update(:title => params[:make_mobile_page][:title],:app_icon => params[:make_mobile_page][:app_icon],:dowanload_button_text => params[:make_mobile_page][:dowanload_button_text],:background => params[:make_mobile_page][:background])

          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "make_mobile_page"
        else
          flash[:error]="Record doesn't updated."
          render :edit_make_mobile_page
        end
      else  
        render :template => "backend/MakeMobilePage/edit_make_mobile_page"
      end
    else      
      flash[:error]="MakeMobilePage with id '#{id}' could not be found"
      redirect_to :action => "make_mobile_page"     
    end
  end

  def delete_make_mobile_page
    @make_mobile_page = MakeMobilePage.find(params[:id])
    @make_mobile_page.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "make_mobile_page"
  end

            # Newsletter Table Methods

  def newsletter
    @newsletters = Newsletter.all.order('id DESC')
        render :template => "backend/Newsletter/newsletter"
  end

  def show_newsletter
    id = params[:id]
    @newsletter = Newsletter.where(:id=>id).first
    render :template => "backend/Newsletter/show_newsletter"
  end

  def add_newsletter
    @newsletter = Newsletter.new
    if request.post?
      @newsletter = Newsletter.new(newsletter_params)
      if @newsletter.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "newsletter"
      else
        flash[:error]="Record doesn't saved."
        render :add_newsletter
      end
      else
        render :template => "backend/Newsletter/add_newsletter"
    end
  end

  def edit_newsletter
    id = params[:id]
    @newsletter = Newsletter.where(:id=>id).first

    if !@newsletter.nil?
      if request.post?
        # render :plain => params.inspect
        if @newsletter.update(:email => params[:newsletter][:email])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "newsletter"
        else
          flash[:error]="Record doesn't updated."
          render :edit_newsletter
        end
        else
          render :template => "backend/Newsletter/edit_newsletter"
      end
    else      
      flash[:error]="Newsletter with id '#{id}' could not be found"
      redirect_to :action => "newsletter"     
    end
  end

  def delete_newsletter
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "newsletter"
  end
            # Product Table Methods

  def product
    @products = Product.all.order('id DESC')
        render :template => "backend/Product/product"
  end

  def show_product
    id = params[:id]
    @product = Product.where(:id=>id).first
    render :template => "backend/Product/show_product"
  end

  def add_product
    @product = Product.new
    if request.post?

    # render :plain => subsc.inspect
      @product = Product.new(product_params)
      if @product.save
          subsc = Array.new
          i = 1;
          j = 0;
          params[:product_color_id].each_with_index do |(key, value), index|
              # subsc << params[:image][i]

            @product_variation = ProductVariation.new(:product_id => @product.id,:image => params[:image][j],:product_color_id => params[:product_color_id][j],:active => params[:active][j])

            @product_variation.save
              # @medicalSect = MedicalSection.find(key)
              i += 1
              j += 1
          end

        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "product"
      else
        flash[:error]="Record doesn't saved."
        render :add_product
      end
    else
      render :template => "backend/Product/add_product"
    end
  end

  def edit_product
    id = params[:id]
    @product = Product.where(:id=>id).first
    @product_variations = ProductVariation.where(:product_id=>id)

    if !@product.nil?
      if request.post?
        # render :plain => params.inspect
        if @product.update(:name => params[:product][:name],:user_id => params[:product][:user_id],:store_category_id => params[:product][:store_category_id],:store_sub_category_id => params[:product][:store_sub_category_id],:device_id => params[:product][:device_id],:sub_device_id => params[:product][:sub_device_id],:case_id => params[:product][:case_id],:layout_id => params[:product][:layout_id],:brand_id => params[:product][:brand_id],:price => params[:product][:price],:description => params[:product][:description],:tag => params[:product][:tag],:is_active => params[:product][:is_active])

          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "product"
        else
          flash[:error]="Record doesn't updated."
          render :edit_product
        end
        else
          render :template => "backend/Product/edit_product"
      end
    else      
      flash[:error]="Product with id '#{id}' could not be found"
      redirect_to :action => "product"     
    end
  end

  def delete_product
    @product_variation = ProductVariation.where(:product_id =>params[:id]).destroy_all
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "product"
  end
                          # Product Variations
  def add_product_variation
    product_id = params[:id]
    @product_variation = ProductVariation.new
    if request.post?
      @product_variation = ProductVariation.new(:image => params[:product_variation][:image],:product_id => product_id,:product_color_id => params[:product_variation][:product_color_id], :active => params[:product_variation][:active])
      if @product_variation.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "edit_product"
      else
        flash[:error]="Record doesn't saved."
        render :add_product_variation
      end
      else
        render :template => "backend/Product/add_product_variation"
    end
  end

  def show_product_variation
    id = params[:id]
    @product_variation = ProductVariation.where(:id=>id).first
    render :template => "backend/Product/show_product_variation"
  end
  def edit_product_variation
    @product_id = params[:product_id]
    id = params[:id]
    @product_variation = ProductVariation.where(:id=>id).first

    if !@product_variation.nil?
      if request.post?
        # render :plain => params.inspect
        if @product_variation.update(:image => params[:product_variation][:image],:product_color_id => params[:product_variation][:product_color_id], :active => params[:product_variation][:active])

          flash[:success]="Record has been updated Sucessfully."
          # url_ppath = "#{request.protocol}#{request.host_with_port}/backend/#{@product_id}/edit_product"
          # render :plain => url_ppath.inspect
          redirect_to :action => "product" 
        else
          flash[:error]="Record doesn't updated."
          render :edit_product_variation
        end
        else
          render :template => "backend/Product/edit_product_variation"
      end
    else      
      flash[:error]="ProductVariation with id '#{id}' could not be found"
      redirect_to :action => "#{product_id}/edit_product"    
    end
  end
  def delete_product_variation
    product_id = params[:product_id]
    @product_variation = ProductVariation.find(params[:id])
    @product_variation.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "#{product_id}/edit_product"
  end
            # ProductColor Table Methods

  def product_color
    @product_colors = ProductColor.all.order('id DESC')
        render :template => "backend/ProductColor/product_color"
  end

  def show_product_color
    id = params[:id]
    @product_color = ProductColor.where(:id=>id).first
    render :template => "backend/ProductColor/show_product_color"
  end

  def add_product_color
    @product_color = ProductColor.new
    if request.post?
      @product_color = ProductColor.new(product_color_params)
      if @product_color.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "product_color"
      else
        flash[:error]="Record doesn't saved."
        render :add_product_color
      end
      else
        render :template => "backend/ProductColor/add_product_color"
    end
  end

  def edit_product_color
    id = params[:id]
    @product_color = ProductColor.where(:id=>id).first

    if !@product_color.nil?
      if request.post?
        # render :plain => params.inspect
        if @product_color.update(:name => params[:product_color][:name],:code => params[:product_color][:code],:store_category_id => params[:product_color][:store_category_id],:store_sub_category_id => params[:product_color][:store_sub_category_id])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "product_color"
        else
          flash[:error]="Record doesn't updated."
          render :edit_product_color
        end
        else
          render :template => "backend/ProductColor/edit_product_color"
      end
    else      
      flash[:error]="ProductColor with id '#{id}' could not be found"
      redirect_to :action => "product_color"     
    end
  end

  def delete_product_color
    @product_color = ProductColor.find(params[:id])
    @product_color.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "product_color"
  end

            # Shipping Address Table Methods

  def shipping_address
    @shipping_addresses = ShippingAddress.all.order('id DESC')
    render :template => "backend/ShippingAddress/shipping_address"
  end

  def show_shipping_address
    id = params[:id]
    @shipping_address = ShippingAddress.where(:id=>id).first
    render :template => "backend/ShippingAddress/show_shipping_address"
  end

  def add_shipping_address
    @shipping_address = ShippingAddress.new
    if request.post?
      @shipping_address = ShippingAddress.new(shipping_address_params)
      if @shipping_address.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "shipping_address"
      else
        flash[:error]="Record doesn't saved."
        render :add_shipping_address
      end
    else
      render :template => "backend/ShippingAddress/add_shipping_address"
    end
  end

  def edit_shipping_address
    id = params[:id]
    @shipping_address = ShippingAddress.where(:id=>id).first

    if !@shipping_address.nil?
      if request.post?
        # render :plain => params.inspect,:user_id

        if @shipping_address.update(:first_name => params[:shipping_address][:first_name],:last_name => params[:shipping_address][:last_name],:address1 => params[:shipping_address][:address1],:country_id => params[:shipping_address][:country_id],:city => params[:shipping_address][:city],:state => params[:shipping_address][:state],:pincode => params[:shipping_address][:pincode],:mobile => params[:shipping_address][:mobile],:user_id => params[:shipping_address][:user_id])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "shipping_address"
        else
          flash[:error]="Record doesn't updated."
          render :edit_shipping_address
        end
      else
        render :template => "backend/ShippingAddress/edit_shipping_address"
      end
    else      
      flash[:error]="ShippingAddress with id '#{id}' could not be found"
      redirect_to :action => "shipping_address"     
    end
  end

  def delete_shipping_address
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "shipping_address"
  end

                        # Stamp Table methods
  def stamp
    # @stamps ||= fetch_stamps
    @stamps = Stamp.all.order('id DESC')
    render :template => "backend/Stamp/stamp"
    # render :plain => @stamps.inspect
  end

  def show_stamp
    id = params[:id]
    @stamp = Stamp.where(:id=>id).first
    render :template => "backend/Stamp/show_stamp"

  end

  def add_stamp
    @stamp = Stamp.new
    if request.post?
      # render :plain => params.inspect
      @stamp = Stamp.new(stamp_params)
      if @stamp.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "stamp"
      else
        flash[:error]="Record doesn't saved."
        render :add_stamp
      end
    else
      render :template => "backend/Stamp/add_stamp"
    end
  end

  def edit_stamp
    id = params[:id]
    @stamp = Stamp.where(:id=>id).first

    if !@stamp.nil?
      if request.post?
        # render :plain => params.inspect
        if @stamp.update(:name => params[:stamp][:name], :image => params[:stamp][:image])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "stamp"
        else
          flash[:error]="Record doesn't updated."
          render :edit_stamp
        end
      else
        render :template => "backend/Stamp/edit_stamp"
      end

    else      
      flash[:error]="Stamp with id '#{id}' could not be found"
      redirect_to :action => "stamp"     
    end

    # render :plain => params.inspect
  end

  def delete_stamp
    # render :plain => params.inspect
    @stamp = Stamp.find(params[:id])
    @stamp.destroy
  flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "stamp"
  end

                        # StampImage Table methods
  def stamp_image
    # @stamp_images ||= fetch_stamp_images
    @stamp_images = StampImage.all.order('id DESC')
    render :template => "backend/StampImage/stamp_image"
    # render :plain => @stamp_images.inspect
  end

  def show_stamp_image
    id = params[:id]
    @stamp_image = StampImage.where(:id=>id).first
    render :template => "backend/StampImage/show_stamp_image"

  end

  def add_stamp_image
    @stamp_image = StampImage.new
    if request.post?
      # render :plain => params.inspect
      @stamp_image = StampImage.new(stamp_image_params)
      if @stamp_image.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "stamp_image"
      else
        flash[:error]="Record doesn't saved."
        render :add_stamp_image
      end
    else
      render :template => "backend/StampImage/add_stamp_image"
    end
  end

  def edit_stamp_image
    id = params[:id]
    @stamp_image = StampImage.where(:id=>id).first

    if !@stamp_image.nil?
      if request.post?
        # render :plain => params.inspect
        if @stamp_image.update(:stamp_id => params[:stamp_image][:stamp_id], :image => params[:stamp_image][:image])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "stamp_image"
        else
          flash[:error]="Record doesn't updated."
          render :edit_stamp_image
        end
      else
        render :template => "backend/StampImage/edit_stamp_image"
      end

    else      
      flash[:error]="StampImage with id '#{id}' could not be found"
      redirect_to :action => "stamp_image"     
    end

    # render :plain => params.inspect
  end

  def delete_stamp_image
    # render :plain => params.inspect
    @stamp_image = StampImage.find(params[:id])
    @stamp_image.destroy
  flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "stamp_image"
  end
            # Store Categories Table Methods

  def store_category
    @store_categories = StoreCategory.all.order('id DESC')
        render :template => "backend/StoreCategory/store_category"
  end

  def show_store_category
    id = params[:id]
    @store_category = StoreCategory.where(:id=>id).first
    render :template => "backend/StoreCategory/show_store_category"
  end

  def add_store_category
    @store_category = StoreCategory.new
    if request.post?
      @store_category = StoreCategory.new(store_category_params)
      if @store_category.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "store_category"
      else
        flash[:error]="Record doesn't saved."
        render :add_store_category
      end
      else
        render :template => "backend/StoreCategory/add_store_category"
    end
  end

  def edit_store_category
    id = params[:id]
    @store_category = StoreCategory.where(:id=>id).first

    if !@store_category.nil?
      if request.post?
        # render :plain => params.inspect
        if @store_category.update(:name => params[:store_category][:name],:is_active => params[:store_category][:is_active])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "store_category"
        else
          flash[:error]="Record doesn't updated."
          render :edit_store_category
        end
        else
          render :template => "backend/StoreCategory/edit_store_category"
      end
    else      
      flash[:error]="StoreCategory with id '#{id}' could not be found"
      redirect_to :action => "store_category"     
    end
  end

  def delete_store_category
    @store_sub_category = StoreCategory.find(params[:id])
    @store_sub_category.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "store_sub_category"
  end
            # Store Sub Categories Table Methods

  def store_sub_category
    @store_sub_categories = StoreSubCategory.all.order('id DESC')
        render :template => "backend/StoreSubCategory/store_sub_category"
  end

  def show_store_sub_category
    id = params[:id]
    @store_sub_category = StoreSubCategory.where(:id=>id).first
    render :template => "backend/StoreSubCategory/show_store_sub_category"
  end

  def add_store_sub_category
    @store_sub_category = StoreSubCategory.new
    if request.post?
      @store_sub_category = StoreSubCategory.new(store_sub_category_params)
      if @store_sub_category.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "store_sub_category"
      else
        flash[:error]="Record doesn't saved."
        render :add_store_sub_category
      end
      else
        render :template => "backend/StoreSubCategory/add_store_sub_category"
    end
  end

  def edit_store_sub_category
    id = params[:id]
    @store_sub_category = StoreSubCategory.where(:id=>id).first

    if !@store_sub_category.nil?
      if request.post?
        # render :plain => params.inspect
        if @store_sub_category.update(:name => params[:store_sub_category][:name],:store_category_id => params[:store_sub_category][:store_category_id],:is_active => params[:store_sub_category][:is_active])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "store_sub_category"
        else
          flash[:error]="Record doesn't updated."
          render :edit_store_sub_category
        end
        else
          render :template => "backend/StoreSubCategory/edit_store_sub_category"
      end
    else      
      flash[:error]="StoreSubCategory with id '#{id}' could not be found"
      redirect_to :action => "store_sub_category"     
    end
  end

  def delete_store_sub_category
    @store_sub_category = StoreSubCategory.find(params[:id])
    @store_sub_category.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "store_sub_category"
  end
            # Sub Device Categories Table Methods

  def sub_device
    @sub_devices = SubDevice.all.order('id DESC')
        render :template => "backend/SubDevice/sub_device"
  end

  def show_sub_device
    id = params[:id]
    @sub_device = SubDevice.where(:id=>id).first
    render :template => "backend/SubDevice/show_sub_device"
  end

  def add_sub_device
    @sub_device = SubDevice.new
    if request.post?
      @sub_device = SubDevice.new(sub_device_params)
      if @sub_device.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "sub_device"
      else
        flash[:error]="Record doesn't saved."
        render :add_sub_device
      end
      else
        render :template => "backend/SubDevice/add_sub_device"
    end
  end

  def edit_sub_device
    id = params[:id]
    @sub_device = SubDevice.where(:id=>id).first

    if !@sub_device.nil?
      if request.post?
        # render :plain => params.inspect
        if @sub_device.update(:name => params[:sub_device][:name],:device_id => params[:sub_device][:device_id],:price => params[:sub_device][:price],:sub_device_image => params[:sub_device][:sub_device_image])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "sub_device"
        else
          flash[:error]="Record doesn't updated."
          render :edit_sub_device
        end
        else
          render :template => "backend/SubDevice/edit_sub_device"
      end
    else      
      flash[:error]="SubDevice with id '#{id}' could not be found"
      redirect_to :action => "sub_device"     
    end
  end

  def delete_sub_device
    @sub_device = SubDevice.find(params[:id])
    @sub_device.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "sub_device"
  end
            # User Meta Categories Table Methods

  def user_meta
    @user_metas = UserMetum.all.order('id DESC')
        render :template => "backend/UserMeta/user_meta"
  end

  def show_user_meta
    id = params[:id]
    @user_meta = UserMetum.where(:id=>id).first
    render :template => "backend/UserMeta/show_user_meta"
  end

  def add_user_meta
    @user_meta = UserMetum.new
    if request.post?
      @user_meta = UserMetum.new(user_metum_params)
      if @user_meta.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "user_meta"
      else
        flash[:error]="Record doesn't saved."
        render :add_user_meta
      end
      else
        render :template => "backend/UserMeta/add_user_meta"
    end
  end

  def edit_user_meta
    id = params[:id]
    @user_meta = UserMetum.where(:id=>id).first

    if !@user_meta.nil?
      if request.post?
        # render :plain => params.inspect
        if @user_meta.update(:user_id => params[:user_metum][:user_id],:currency => params[:user_metum][:currency])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "user_meta"
        else
          flash[:error]="Record doesn't updated."
          render :edit_user_meta
        end
        else
          render :template => "backend/UserMeta/edit_user_meta"
      end
    else      
      flash[:error]="UserMeta with id '#{id}' could not be found"
      redirect_to :action => "user_meta"     
    end
  end

  def delete_user_meta
    @user_meta = UserMetum.find(params[:id])
    @user_meta.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "user_meta"
  end
            # Wishlist Categories Table Methods

  def wishlist
    @wishlists = Wishlist.all.order('id DESC')
        render :template => "backend/Wishlist/wishlist"
  end

  def show_wishlist
    id = params[:id]
    @wishlist = Wishlist.where(:id=>id).first
    render :template => "backend/Wishlist/show_wishlist"
  end

  def add_wishlist
    @wishlist = Wishlist.new
    if request.post?
      @wishlist = Wishlist.new(wishlist_params)
      if @wishlist.save
        flash[:success]="Record has been saved Sucessfully."
        redirect_to :action => "wishlist"
      else
        flash[:error]="Record doesn't saved."
        render :add_wishlist
      end
      else
        render :template => "backend/Wishlist/add_wishlist"
    end
  end

  def edit_wishlist
    id = params[:id]
    @wishlist = Wishlist.where(:id=>id).first

    if !@wishlist.nil?
      if request.post?
        # render :plain => params.inspect
        if @wishlist.update(:user_id => params[:wishlist][:user_id],:product_id => params[:wishlist][:product_id],:product_variation_id => params[:wishlist][:product_variation_id])
          flash[:success]="Record has been updated Sucessfully."
          redirect_to :action => "wishlist"
        else
          flash[:error]="Record doesn't updated."
          render :edit_wishlist
        end
        else
          render :template => "backend/Wishlist/edit_wishlist"
      end
    else      
      flash[:error]="Wishlist with id '#{id}' could not be found"
      redirect_to :action => "wishlist"     
    end
  end

  def delete_wishlist
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    flash[:success]="Record has been deleted Sucessfully."
    redirect_to :action => "wishlist"
  end

  private

  def billing_address_params
    params.require(:billing_address).permit(:first_name,:last_name,:country_id,:address,:city,:state,:pincode,:mobile,:user_id)
  end
  def brand_params
    params.require(:brand).permit(:name,:store_category_id,:store_sub_category_id,:sub_device_id,:is_active)
  end
  def case_params
    params.require(:case).permit(:name,:sub_device_id,:image,:description,:long_description,:device_id,:is_active)
  end
  def case_type_params
    params.require(:case_type).permit(:name,:case_id,:image,:active)
  end
  def country_params
    params.require(:country).permit(:name,:code)
  end
  def currency_params
    params.require(:currency).permit(:name)
  end
  def faq_params
    params.require(:faq).permit(:faq_category_id,:question,:answer,:is_active)
  end
  def faq_category_params
    params.require(:faq_category).permit(:name,:is_active)
  end
  def home_slider_params
    params.require(:home_slider).permit(:title,:subtitle,:image,:link)
  end
  def layout_params
    params.require(:home_slider).permit(:name,:device_id,:image,:is_active)
  end
  def make_mobile_page_params
    params.require(:make_mobile_page).permit(:title,:app_icon,:dowanload_button_text,:background)
  end
  def newsletter_params
    params.require(:layout).permit(:email)
  end
  def product_params
    params.require(:product).permit(:name,:user_id,:store_category_id,:store_sub_category_id,:device_id,:sub_device_id,:case_id,:layout_id,:brand_id,:price,:description,:tag,:is_active)
  end
  def product_color_params
    params.require(:product_color).permit(:name,:code,:store_category_id,:store_sub_category_id)
  end
  def shipping_address_params
    params.require(:shipping_address).permit(:first_name,:last_name,:country_id,:address1,:city,:state,:pincode,:mobile,:user_id)
  end
  def stamp_params
    params.require(:stamp).permit(:name,:image,:active)
  end
  def stamp_image_params
    params.require(:stamp_image).permit(:stamp_id,:image)
  end
  def store_category_params
    params.require(:store_category).permit(:name,:is_active)
  end
  def store_sub_category_params
    params.require(:store_sub_category).permit(:name,:store_category_id,:is_active)
  end
  def sub_device_params
    params.require(:sub_device).permit(:name,:device_id,:price,:sub_device_image)
  end
  def user_metum_params
    params.require(:user_metum).permit(:user_id,:currency)
  end
  def wishlist_params
    params.require(:user_meta).permit(:user_id,:product_id,:product_variation_id)
  end
  def user_params
    params.require(:user).permit(:name)
  end
  def device_params
    params.require(:device).permit(:name,:device_image)
  end


  def page
    params[:iDisplayStart].to_i/10 + 1
  end

  def per_pages
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end
end
