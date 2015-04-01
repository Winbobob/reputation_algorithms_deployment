class AddTeamDb < ActiveRecord::Migration
def up
    create_table :teams do |t|
    	t.integer :client_id
    end
    add_foreign_key :teams, :clients
  end

  def down
  	remove_foreign_key :teams, :clients
  	drop_table :teams
  end
end