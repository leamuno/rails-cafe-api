require 'open-uri'

puts "Removing all pokemon from the DB..."
Pokemon.destroy_all
puts "Getting the pokemon from the JSON..."
pokemons = []
index = 1

151.times do
  # Making an HTTP request to get back the JSON data
  json_pokemon = URI.open("https://pokeapi.co/api/v2/pokemon/#{index}").read
  # Converting the JSON data into a ruby object (this case an array)
  pokemon = JSON.parse(json_pokemon)
  # push instance of pokemon into the pokemon array
  pokemons << pokemon
  index += 1
end

pokemons.each do |pokemon_hash|
  puts "Creating #{pokemon_hash['name']}..."
  pokemon = Pokemon.new(
    name: pokemon_hash['name'],
    dex_id: pokemon_hash['id'],
    pictures: [
      pokemon_hash['sprites']["other"]["official-artwork"]["front_default"],
      pokemon_hash['sprites']["other"]["official-artwork"]["front_shiny"]
    ]
  )
  json_encounters = URI.open(pokemon_hash['location_area_encounters']).read
  encounters = JSON.parse(json_encounters)
  if encounters.empty?
    pokemon.encounter = "no encounter"
  else
    pokemon.encounter = encounters[0]["location_area"]["name"].gsub("-", " ")
  end
  pokemon.types = pokemon_hash["types"].map { |type| type["type"]["name"] }
  pokemon.save
end
p Pokemon.last
puts "... created #{Pokemon.count} pokemon!"
