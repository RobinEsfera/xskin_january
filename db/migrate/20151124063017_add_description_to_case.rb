class AddDescriptionToCase < ActiveRecord::Migration
  def change
    add_column :cases, :long_description, :text
  end
end
