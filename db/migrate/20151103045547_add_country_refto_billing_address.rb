class AddCountryReftoBillingAddress < ActiveRecord::Migration
  def change
  	 add_reference :billing_addresses, :country, index: true, foreign_key: true
  end
end
