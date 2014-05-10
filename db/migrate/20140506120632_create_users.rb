class CreateUsers < ActiveRecord::Migration
  def change
    alter_table :users do |t|
      t.string :username
      t.string :password
      t.string :role

      t.timestamps
    end
  end
end
