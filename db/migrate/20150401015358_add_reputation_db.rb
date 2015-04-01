class AddReputationDb < ActiveRecord::Migration
def up
    create_table :reputations do |t|
      t.integer :task_id
      t.float :reputation_score
      t.float :user_reputation
    end
    add_foreign_key :reputations, :tasks
  end

  def down
  	remove_foreign_key :reputations, :tasks
  	drop_table :reputations
  end
end
