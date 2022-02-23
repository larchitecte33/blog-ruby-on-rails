class AddPartNumberToProducts < ActiveRecord::Migration
  def change
    # Ajoute la colonne part_number de type string à la table products
    add_column :products, :part_number, :string
  end
end
