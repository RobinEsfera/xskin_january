class CreateFaqCategories < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.string :name
      t.boolean :is_active, default: true 

      t.timestamps null: false
    end
  end
end
