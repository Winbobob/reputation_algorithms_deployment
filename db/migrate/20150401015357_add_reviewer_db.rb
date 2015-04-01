class AddReviewerDb < ActiveRecord::Migration
def up
    create_table :reviewers do |t|
    	t.integer :client_id
    end
    add_foreign_key :reviewers, :clients
  end

  def down
  	remove_foreign_key :reviewers, :clients
  	drop_table :reviewers
  end
end