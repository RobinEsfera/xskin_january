class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :name
      t.string :image
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
