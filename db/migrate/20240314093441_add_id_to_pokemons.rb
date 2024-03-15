class AddIdToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :dex_id, :integer
  end
end
