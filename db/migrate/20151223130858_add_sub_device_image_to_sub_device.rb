class AddSubDeviceImageToSubDevice < ActiveRecord::Migration
  def change
    add_column :sub_devices, :sub_device_image, :string
  end
end
