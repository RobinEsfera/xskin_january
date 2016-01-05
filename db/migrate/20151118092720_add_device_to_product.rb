class AddDeviceToProduct < ActiveRecord::Migration
  def change
  	add_reference :products, :device, index: true, foreign_key: true
  end
end
