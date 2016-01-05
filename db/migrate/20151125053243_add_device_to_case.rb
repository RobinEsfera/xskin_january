class AddDeviceToCase < ActiveRecord::Migration
  def change
    add_reference :cases, :device, index: true, foreign_key: true
  end
end
