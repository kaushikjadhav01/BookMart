class AddKeysToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :quantity, :integer
  end
end
