class AddReputationDb < ActiveRecord::Migration
  def up
    create_table :reputations do |t|
      t.string :user_alias_name
      t.float :score_by_reviewer
      t.float :score_by_author
      t.float :score_by_TA
      t.float :calibration_data
      t.string :text_matrics
      t.float :previous_reputation
      t.string :other_data
      t.timestamps null: false
    end
  end

  def down
  	drop_table :reputations
  end
end
