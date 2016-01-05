class Product < ActiveRecord::Base
	belongs_to :user
  belongs_to :store_category
	belongs_to :store_sub_category
	belongs_to :device
	belongs_to :sub_device
	belongs_to :case
	belongs_to :layout
	belongs_to :brand
	has_many :product_images


  rails_admin do
  	# list do
   #    include_all_fields
   #    exclude_fields :id
   #  end

    create do
      # field :title
      field :name    
      field :user   
      field :store_category
      field :store_sub_category
      field :device    
      
	  field :sub_device
      include_all_fields
      # field :location
      # exclude_fields :modified_at
    end
  	edit do

      field :name    
      field :user   
      field :store_category
      field :store_sub_category
      field :device    
      field :sub_device    
      include_all_fields
     	# field :title    
     	# field :location
   		# exclude_fields :modified_at
  	end
  end
end
