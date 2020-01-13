class AddAddressLatAndLongToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :address, :string
    add_column :posts, :lat, :decimal, {:precision=> 10, :scale=>6}
    add_column :posts, :lng, :decimal, {:precision=> 10, :scale=>6}
  end
end
