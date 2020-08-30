class AddDetailsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :serves, :string
    add_column :recipes, :prep, :string
    add_column :recipes, :wait, :string
  end
end
