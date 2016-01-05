class AddCountryToShippingAddress < ActiveRecord::Migration
  def change
    add_reference :shipping_addresses, :country, index: true, foreign_key: true
  end
end
