class AddUserDb < ActiveRecord::Migration
def up
    create_table :users do |t|
    	t.integer :client_id
    end
    add_foreign_key :users, :clients
  end

  def down
  	remove_foreign_key :users, :clients
  	drop_table :users
  end
end