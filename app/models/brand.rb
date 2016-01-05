class Brand < ActiveRecord::Base
	belongs_to :store_sub_category
	belongs_to :sub_device
  belongs_to :store_category

  rails_admin do

    list do
      # field :title
      field :id    
      field :name    
      field :store_category
      field :store_sub_category  
      include_all_fields
      # field :location
      # exclude_fields :modified_at
    end
    create do
      # field :title
      field :name    
      field :store_category
      field :store_sub_category  
      include_all_fields
      # field :location
      # exclude_fields :modified_at
    end
    edit do
      field :name    
      field :store_category
      field :store_sub_category  
      include_all_fields  
      # field :location
      # exclude_fields :modified_at
    end
  end
end
