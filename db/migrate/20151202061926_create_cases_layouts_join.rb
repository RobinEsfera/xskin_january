class CreateCasesLayoutsJoin < ActiveRecord::Migration
  def change
    create_table :cases_layouts, :id => false do |t|
      t.integer :case_id
      t.integer :layout_id
    end
  end
end
