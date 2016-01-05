Rails.application.routes.draw do

  get 'backend', to: 'backend#index'
  get 'backend/user'
  match 'backend/add_user', to: 'backend#add_user', :via => :all
  match 'backend/:id/show_user', to: 'backend#show_user', :via => :all
  match 'backend/:id/edit_user', to: 'backend#edit_user', :via => :all
  delete 'backend/:id/delete_user', to: 'backend#delete_user'

  get 'backend/device'
  match 'backend/add_device', to: 'backend#add_device', :via => :all
  match 'backend/:id/show_device', to: 'backend#show_device', :via => :all
  match 'backend/:id/edit_device', to: 'backend#edit_device', :via => :all
  delete 'backend/:id/delete_device', to: 'backend#delete_device'

  get 'backend/billing_address'
  match 'backend/add_billing_address', to: 'backend#add_billing_address', :via => :all
  match 'backend/:id/show_billing_address', to: 'backend#show_billing_address', :via => :all
  match 'backend/:id/edit_billing_address', to: 'backend#edit_billing_address', :via => :all
  delete 'backend/:id/delete_billing_address', to: 'backend#delete_billing_address'

  get 'backend/brand'
  match 'backend/add_brand', to: 'backend#add_brand', :via => :all
  match 'backend/:id/show_brand', to: 'backend#show_brand', :via => :all
  match 'backend/:id/edit_brand', to: 'backend#edit_brand', :via => :all
  delete 'backend/:id/delete_brand', to: 'backend#delete_brand'

  get 'backend/case'
  match 'backend/add_case', to: 'backend#add_case', :via => :all
  match 'backend/:id/show_case', to: 'backend#show_case', :via => :all
  match 'backend/:id/edit_case', to: 'backend#edit_case', :via => :all
  delete 'backend/:id/delete_case', to: 'backend#delete_case'

  get 'backend/case_type'
  match 'backend/add_case_type', to: 'backend#add_case_type', :via => :all
  match 'backend/:id/show_case_type', to: 'backend#show_case_type', :via => :all
  match 'backend/:id/edit_case_type', to: 'backend#edit_case_type', :via => :all
  delete 'backend/:id/delete_case_type', to: 'backend#delete_case_type'

  get 'backend/country'
  match 'backend/add_country', to: 'backend#add_country', :via => :all
  match 'backend/:id/show_country', to: 'backend#show_country', :via => :all
  match 'backend/:id/edit_country', to: 'backend#edit_country', :via => :all
  delete 'backend/:id/delete_country', to: 'backend#delete_country'

  get 'backend/currency'
  match 'backend/add_currency', to: 'backend#add_currency', :via => :all
  match 'backend/:id/show_currency', to: 'backend#show_currency', :via => :all
  match 'backend/:id/edit_currency', to: 'backend#edit_currency', :via => :all
  delete 'backend/:id/delete_currency', to: 'backend#delete_currency'

  get 'backend/faq'
  match 'backend/add_faq', to: 'backend#add_faq', :via => :all
  match 'backend/:id/show_faq', to: 'backend#show_faq', :via => :all
  match 'backend/:id/edit_faq', to: 'backend#edit_faq', :via => :all
  delete 'backend/:id/delete_faq', to: 'backend#delete_faq'

  get 'backend/faq_category'
  match 'backend/add_faq_category', to: 'backend#add_faq_category', :via => :all
  match 'backend/:id/show_faq_category', to: 'backend#show_faq_category', :via => :all
  match 'backend/:id/edit_faq_category', to: 'backend#edit_faq_category', :via => :all
  delete 'backend/:id/delete_faq_category', to: 'backend#delete_faq_category'

  get 'backend/home_slider'
  match 'backend/add_home_slider', to: 'backend#add_home_slider', :via => :all
  match 'backend/:id/show_home_slider', to: 'backend#show_home_slider', :via => :all
  match 'backend/:id/edit_home_slider', to: 'backend#edit_home_slider', :via => :all
  delete 'backend/:id/delete_home_slider', to: 'backend#delete_home_slider'

  get 'backend/layout'
  match 'backend/add_layout', to: 'backend#add_layout', :via => :all
  match 'backend/:id/show_layout', to: 'backend#show_layout', :via => :all
  match 'backend/:id/edit_layout', to: 'backend#edit_layout', :via => :all
  delete 'backend/:id/delete_layout', to: 'backend#delete_layout'

  get 'backend/make_mobile_page'
  match 'backend/add_make_mobile_page', to: 'backend#add_make_mobile_page', :via => :all
  match 'backend/:id/show_make_mobile_page', to: 'backend#show_make_mobile_page', :via => :all
  match 'backend/:id/edit_make_mobile_page', to: 'backend#edit_make_mobile_page', :via => :all
  delete 'backend/:id/delete_make_mobile_page', to: 'backend#delete_make_mobile_page'

  get 'backend/newsletter'
  match 'backend/add_newsletter', to: 'backend#add_newsletter', :via => :all
  match 'backend/:id/show_newsletter', to: 'backend#show_newsletter', :via => :all
  match 'backend/:id/edit_newsletter', to: 'backend#edit_newsletter', :via => :all
  delete 'backend/:id/delete_newsletter', to: 'backend#delete_newsletter'

  get 'backend/product'
  match 'backend/add_product', to: 'backend#add_product', :via => :all
  match 'backend/:id/show_product', to: 'backend#show_product', :via => :all
  match 'backend/:id/edit_product', to: 'backend#edit_product', :via => :all
  delete 'backend/:id/delete_product', to: 'backend#delete_product'

  get 'backend/product_color'
  match 'backend/add_product_color', to: 'backend#add_product_color', :via => :all
  match 'backend/:id/show_product_color', to: 'backend#show_product_color', :via => :all
  match 'backend/:id/edit_product_color', to: 'backend#edit_product_color', :via => :all
  delete 'backend/:id/delete_product_color', to: 'backend#delete_product_color'

  get 'backend/product_variation'
  match 'backend/:id/add_product_variation', to: 'backend#add_product_variation', :via => :all
  match 'backend/:id/show_product_variation', to: 'backend#show_product_variation', :via => :all
  match 'backend/:id/edit_product_variation', to: 'backend#edit_product_variation', :via => :all
  delete 'backend/:id/delete_product_variation', to: 'backend#delete_product_variation'

  get 'backend/shipping_address'
  match 'backend/add_shipping_address', to: 'backend#add_shipping_address', :via => :all
  match 'backend/:id/show_shipping_address', to: 'backend#show_shipping_address', :via => :all
  match 'backend/:id/edit_shipping_address', to: 'backend#edit_shipping_address', :via => :all
  delete 'backend/:id/delete_shipping_address', to: 'backend#delete_shipping_address'

  get 'backend/stamp'
  match 'backend/add_stamp', to: 'backend#add_stamp', :via => :all
  match 'backend/:id/show_stamp', to: 'backend#show_stamp', :via => :all
  match 'backend/:id/edit_stamp', to: 'backend#edit_stamp', :via => :all
  delete 'backend/:id/delete_stamp', to: 'backend#delete_stamp'

  get 'backend/stamp_image'
  match 'backend/add_stamp_image', to: 'backend#add_stamp_image', :via => :all
  match 'backend/:id/show_stamp_image', to: 'backend#show_stamp_image', :via => :all
  match 'backend/:id/edit_stamp_image', to: 'backend#edit_stamp_image', :via => :all
  delete 'backend/:id/delete_stamp_image', to: 'backend#delete_stamp_image'

  get 'backend/store_category'
  match 'backend/add_store_category', to: 'backend#add_store_category', :via => :all
  match 'backend/:id/show_store_category', to: 'backend#show_store_category', :via => :all
  match 'backend/:id/edit_store_category', to: 'backend#edit_store_category', :via => :all
  delete 'backend/:id/delete_store_category', to: 'backend#delete_store_category'
  # get 'backend/delete_device'

  get 'backend/store_sub_category'
  match 'backend/add_store_sub_category', to: 'backend#add_store_sub_category', :via => :all
  match 'backend/:id/show_store_sub_category', to: 'backend#show_store_sub_category', :via => :all
  match 'backend/:id/edit_store_sub_category', to: 'backend#edit_store_sub_category', :via => :all
  delete 'backend/:id/delete_store_sub_category', to: 'backend#delete_store_sub_category'


  get 'backend/sub_device'
  match 'backend/add_sub_device', to: 'backend#add_sub_device', :via => :all
  match 'backend/:id/show_sub_device', to: 'backend#show_sub_device', :via => :all
  match 'backend/:id/edit_sub_device', to: 'backend#edit_sub_device', :via => :all
  delete 'backend/:id/delete_sub_device', to: 'backend#delete_sub_device'

  get 'backend/user_meta'
  match 'backend/add_user_meta', to: 'backend#add_user_meta', :via => :all
  match 'backend/:id/show_user_meta', to: 'backend#show_user_meta', :via => :all
  match 'backend/:id/edit_user_meta', to: 'backend#edit_user_meta', :via => :all
  delete 'backend/:id/delete_user_meta', to: 'backend#delete_user_meta'

  get 'backend/wishlist'
  match 'backend/add_wishlist', to: 'backend#add_wishlist', :via => :all
  match 'backend/:id/show_wishlist', to: 'backend#show_wishlist', :via => :all
  match 'backend/:id/edit_wishlist', to: 'backend#edit_wishlist', :via => :all
  delete 'backend/:id/delete_wishlist', to: 'backend#delete_wishlist'


  get "admin/login"
  # get "admin/user"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # root 'page#home'
  post 'ajax/get_sub_device'
  post 'ajax/get_store_sub_category'

  post 'page/get_product_from_color'
  post 'page/get_cases_from_id'
  post 'page/upload_image'
  post 'page/upload_image_remove'

  get 'cart', to: 'page#cart'
  get 'cart/clear', to: 'page#clear_cart'
  # get 'cart/:id', to: 'page#add_cart'
  match 'cart/:id', to: 'page#add_cart', :via => :all

  get 'checkout_shipping', to: 'page#checkout_shipping'
  get 'payment', to: 'page#payment'

  get 'wishlist', to: 'page#wishlist'
  get 'wishlist/clear', to: 'page#clear_wishlist'
  match 'wishlist/:id', to: 'page#add_wishlist', :via => :all

  post "page/checkout_shipping_submit"
  post "page/get_billing_address"
  post "page/get_shipping_address"

  get 'page/home'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks",registrations: "registrations" }
  get 'store', to: "page#store"
  get 'apple_watch', to: "page#apple_watch"
  get 'iphone6', to: "page#iphone6"
  get 'make', to: "page#make"
  get 'gallery', to: "page#gallery" 
  get 'invite', to: "page#invite" 
  get 'track', to: "page#track" 
  get 'promotion', to: "page#promotion" 
  get 'top_design', to: "page#top_design" 
  get 'angular_test',to: 'page#angular_test'
  get 'demo',to: 'page#demo'
  get 'terms',to: 'page#terms'
  get 'developer',to: 'page#developer'
  get 'careers',to: 'page#careers'
  get 'faq',to: 'page#faq'
  get 'privacy',to: 'page#privacy'
  get 'terms',to: 'page#terms'
  get 'contact',to: 'page#contact'
  get 'testimonial',to: 'page#testimonial'
  get 'affiliate',to: 'page#affiliate'
  get 'spotting',to: 'page#spotting'
  get 'gift',to: 'page#gift'
  get 'product',to: 'page#product'
  get "page/send_email" 
  get 'store_category',to: "page#store_category" 
  post "page/select_currency" 
  post "shipping/address_edit"
  post "page/newsletter_submit"
  post "page/billing_address"
  root :to => redirect("https://www.facebook.com/goxskin")

end
