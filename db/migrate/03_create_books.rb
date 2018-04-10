class CreateBooks < ActiveRecord::Migration[4.2] 

    def change 
      create_table :books do |t|
        t.string :title 
        t.string :author
        t.string :quote
        t.integer :shelf_id 
      end 
    end
  
      def down 
        drop_table :books 
      end 
      
  end 