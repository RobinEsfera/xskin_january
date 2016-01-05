class ChangeStateFormatInBillingAddress < ActiveRecord::Migration
  def change
  	change_column :billing_addresses, :state, :string
  end
end
