class CreateBillingAddresses < ActiveRecord::Migration
  def change
    create_table :billing_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :country
      t.string :city
      t.integer :state
      t.integer :pincode
      t.integer :mobile

      t.timestamps null: false
    end
  end
end
