class AddUsertoBillingAddress < ActiveRecord::Migration
  def change
  	add_column :billing_addresses, :user_id, :integer
  end
end
