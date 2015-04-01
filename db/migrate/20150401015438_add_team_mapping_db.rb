class AddTeamMappingDb < ActiveRecord::Migration
  def up
    create_table :team_mappings do |t|
    	t.integer :team_id
    	t.integer :user_id
    end
    add_foreign_key :team_mappings, :teams
    add_foreign_key :team_mappings, :users
  end

  def down
  	remove_foreign_key :team_mappings, :users
    remove_foreign_key :team_mappings, :teams
  	drop_table :team_mappings
  end
end