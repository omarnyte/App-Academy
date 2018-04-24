# json.partial! './_guest.json.jbuilder', guests: @guests

# json.set! :guests do
json.array! @guests, partial: 'api/guests/guest', as: :guest, show_gifts: false
# end

# json.array! @guests do |guest|
#   json.name guest.name
#   json.age guest.age
#   json.favorite_color guest.favorite_color
# end
