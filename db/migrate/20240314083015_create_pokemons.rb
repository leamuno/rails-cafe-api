class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :dex_id
      t.string :encounter
      t.string :pictures, array: true
      t.string :types, array: true

      t.timestamps
    end
  end
end
