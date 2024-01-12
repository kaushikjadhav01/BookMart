class CreateTransactionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_items do |t|
      t.integer :transaction_id
      t.integer :book_id
      t.integer :user_id
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :subtotal

      t.timestamps
    end
  end
end
