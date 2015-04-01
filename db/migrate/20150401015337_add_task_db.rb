class AddTaskDb < ActiveRecord::Migration
def up
    create_table :tasks do |t|
      t.integer :assignment_id
      t.float :PR_max_score
      t.float :PR_min_score
      t.float :BR_max_score
      t.float :BR_min_score
    end
    add_foreign_key :tasks, :assignments
  end

  def down
  	remove_foreign_key :tasks, :assignments
  	drop_table :tasks
  end
end