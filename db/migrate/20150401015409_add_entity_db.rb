class AddEntityDb < ActiveRecord::Migration
def up
    create_table :entities do |t|
    	t.integer :client_id
    end
    add_foreign_key :entities, :clients
  end

  def down
  	remove_foreign_key :entities, :clients
  	drop_table :entities
  end
end