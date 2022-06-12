class AddColumnsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :trade, :string
    add_column :posts, :currency, :string
    add_column :posts, :stock_index, :string
  end
end
