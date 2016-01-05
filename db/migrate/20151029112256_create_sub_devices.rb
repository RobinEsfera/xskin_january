class CreateSubDevices < ActiveRecord::Migration
  def change
    create_table :sub_devices do |t|
      t.string :name
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
