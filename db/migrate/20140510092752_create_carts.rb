class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user
      t.integer :item
      t.string :status

      t.timestamps
    end
  end
end
