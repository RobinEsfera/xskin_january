class CreateStampImages < ActiveRecord::Migration
  def change
    create_table :stamp_images do |t|
      t.references :stamp, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
