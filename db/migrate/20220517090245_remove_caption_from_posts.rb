class RemoveCaptionFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :caption, :string
  end
end
