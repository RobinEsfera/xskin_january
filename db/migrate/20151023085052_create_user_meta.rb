class CreateUserMeta < ActiveRecord::Migration
  def change
    create_table :user_meta do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
