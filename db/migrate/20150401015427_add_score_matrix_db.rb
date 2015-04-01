class AddScoreMatrixDb < ActiveRecord::Migration
 def up
    create_table :score_matrices do |t|
      t.integer :reviewer_id
      t.integer :entity_id
      t.integer :task_id
		  t.float :score
		  t.string :type
    end
    add_foreign_key :score_matrices, :reviewers
    add_foreign_key :score_matrices, :entities  
	  add_foreign_key :score_matrices, :tasks	
  end

  def down
    remove_foreign_key :score_matrices, :tasks  
    remove_foreign_key :score_matrices, :entities  
    remove_foreign_key :score_matrices, :reviewers
  	drop_table :score_matrices
  end
end