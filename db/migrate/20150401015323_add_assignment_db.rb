class AddAssignmentDb < ActiveRecord::Migration
  def up
    create_table :assignments do |t|  
      t.integer :client_id  
    end
    add_foreign_key :assignments, :clients
  end

  def down
  	remove_foreign_key :assignments, :clients
  	drop_table :assignments
  end
end
