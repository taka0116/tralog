class AddTradedAtToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :traded_at, :date
  end
end
