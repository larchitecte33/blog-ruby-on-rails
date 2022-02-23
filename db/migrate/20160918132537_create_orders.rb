class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :designation
      t.integer :quantite
      t.float :prix_unitaire
      t.float :prix_ttc

      t.timestamps null: false
    end
  end
end
