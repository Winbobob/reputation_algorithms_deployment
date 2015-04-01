class AddReviewedEntityMatrixDb < ActiveRecord::Migration
  def up
    create_table :reviewed_entity_matrices do |t|
    	t.integer :entity_id
    	t.float :score
      t.string :type
    end
    add_foreign_key :reviewed_entity_matrices, :entities
  end

  def down
    remove_foreign_key :reviewed_entity_matrices, :entities
  	drop_table :reviewed_entity_matrices
  end
end