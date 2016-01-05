class AddPriceToSubDevice < ActiveRecord::Migration
  def change
    add_column :sub_devices, :price, :float
  end
end
