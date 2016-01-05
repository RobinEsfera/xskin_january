class AddCurrencyToUserMeta < ActiveRecord::Migration
  def change
    add_column :user_meta, :currency, :string
  end
end
