class AddCustomerDb < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :home_phone
      t.string :work_phone
      t.string :email
      t.timestamps null: false
    end
  end

  def down
  	drop_table :customers
  end
end
