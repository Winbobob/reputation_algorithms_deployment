class AddReputationDb < ActiveRecord::Migration
def up
    create_table :reputations do |t|
      t.integer :reviewer_id
      t.integer :task_id
      t.float :score
    end
    add_foreign_key :reputations, :tasks
    add_foreign_key :reputations, :reviewers
  end

  def down
    remove_foreign_key :reputations, :reviewers
  	remove_foreign_key :reputations, :tasks
  	drop_table :reputations
  end
end
