class AddDeviceToLayouts < ActiveRecord::Migration
  def change
    add_reference :layouts, :device, index: true, foreign_key: true
  end
end
