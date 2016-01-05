class CreateMakeMobilePages < ActiveRecord::Migration
  def change
    create_table :make_mobile_pages do |t|
      t.string :title
      t.string :app_icon
      t.string :dowanload_button_text
      t.string :background

      t.timestamps null: false
    end
  end
end
