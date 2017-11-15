json.partial! 'api/guests/guest', guest: @guest
# debugger

json.set! :gifts do
  json.array! @guest.gifts, :title, :description
  # @guest.gifts.each do |gift|
  #   json.extract! gift, :title, :description
  # end
end
