class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :make
      t.string :model
      t.integer :model_year
      t.integer :price
      t.integer :odometer
      t.string :title_status
      t.string :city
      t.string :description

      t.timestamps
    end
  end
end
