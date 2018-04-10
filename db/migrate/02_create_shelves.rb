class CreateShelves < ActiveRecord::Migration[4.2]

  def up 
    create_table :shelves do |t|
      t.string :name 
      t.integer :user_id
    end 
  end 

  def down
    drop table :shelves
  end 

end 