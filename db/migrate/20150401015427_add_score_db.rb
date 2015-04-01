class AddScoreDb < ActiveRecord::Migration
 def up
    create_table :scores do |t|
      t.integer :reviewer_id
      t.integer :reviewee_id
		  t.float :peer_review_score
		  t.integer :peer_review_length
		  t.string :type
    end
    add_foreign_key :scores, :users, column: :reviewer_id, primary_key: "id"
	  add_foreign_key :scores, :teams, column: :reviewee_id, primary_key: "id"	
  end

  def down
	  remove_foreign_key :scores, :teams, column: :reviewee_id, primary_key: "id"
    remove_foreign_key :scores, :users, column: :reviewer_id, primary_key: "id"
  	drop_table :scores
  end
end