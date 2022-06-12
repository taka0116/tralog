class AddDetailsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :stock_code, :integer
    add_column :posts, :stock_name, :string
    add_column :posts, :profit, :integer
    add_column :posts, :memo, :text
  end
end
