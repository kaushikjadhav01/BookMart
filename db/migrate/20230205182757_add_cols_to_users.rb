class AddColsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :credit_card_number, :string
    add_column :users, :phone_number, :string
  end
end
