class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :country
      t.string :city
      t.string :state
      t.integer :pincode
      t.bigint :mobile
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
