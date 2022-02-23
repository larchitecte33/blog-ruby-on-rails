class CreateProducts < ActiveRecord::Migration
  def change
    # This migration adds a table called products with a string column called 
    # name and a text column called description. A primary key column called id 
    # will also be added implicitly, as it's the default primary key for all 
    # Active Record models. The timestamps macro adds two columns, created_at 
    # and updated_at. These special columns are automatically managed by Active 
    # Record if they exist
    create_table :products do |t|
      t.string :name
      t.text :description
      
      t.timestamps null: false
    end
  end
end
