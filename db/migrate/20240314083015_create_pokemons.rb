class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :encounter
      t.string :pictures, array: true
      t.jsonb :types

      t.timestamps
    end
  end
end
