class AddImagesToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :image, :string, :limit => 5000
  end
end
