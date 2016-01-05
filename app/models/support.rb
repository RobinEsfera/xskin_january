class Support < ActiveRecord::Base

  rails_admin do
  	list do
      include_all_fields
    end

    create do
      field :page_name  
      field :content, :ck_editor  
      field :extra  
      field :is_active  
    end
  	edit do
      field :page_name  
      field :content, :ck_editor  
      field :extra  
      field :is_active 
  	end
  end
end
