class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.references :faq_category, index: true, foriegn_key: true
      t.text :question
      t.text :answer
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
