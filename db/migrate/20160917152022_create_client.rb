class CreateClient < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.datetime :created_at
      t.string :first_name
      t.boolean :locked
      t.integer :orders_count
      t.datetime :updated_at
      
      t.timestamps null: false
    end
  end
end
