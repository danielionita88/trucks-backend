class RemoveCityFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :city, :string
  end
end
