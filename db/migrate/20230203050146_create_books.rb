class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :publisher
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end
