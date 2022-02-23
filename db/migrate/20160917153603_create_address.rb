class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :street
      t.string :post_code
      t.string :town
    end
  end
end
