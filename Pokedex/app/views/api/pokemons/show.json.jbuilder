json.set! :pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves
  json.image_url asset_path(@pokemon.image_url)

  item_ids = @pokemon.items.map{ |item| item.id }

  json.set! :item_ids do
    json.array! item_ids
  end
end

json.set! :items do
  json.array! @pokemon.items, :id, :name, :pokemon_id, :price, :happiness, :image_url
end
