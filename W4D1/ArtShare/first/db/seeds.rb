# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

van_gogh = User.create(username: 'van_gogh')
rothko = User.create(username: 'rothko')
picasso = User.create(username: 'picasso')
warhol = User.create(username: 'warhol')

starry_night = Artwork.create(title: 'Starry Night', image_url: 'website1', artist_id: van_gogh.id)
no_3 = Artwork.create(title: 'No. 3', image_url: 'website2', artist_id: rothko.id)
picasso_old_guitarist = Artwork.create(title: 'The Old Guitarist', image_url: 'website3', artist_id: picasso.id)
warhol_old_guitarist = Artwork.create(title: 'The Old Guitarist', image_url: 'website4', artist_id: warhol.id)

ArtworkShare.create(artwork_id: starry_night.id, viewer_id: rothko.id)
ArtworkShare.create(artwork_id: no_3.id, viewer_id: picasso.id)
ArtworkShare.create(artwork_id: picasso_old_guitarist.id, viewer_id: warhol.id)
ArtworkShare.create(artwork_id: warhol_old_guitarist.id, viewer_id: van_gogh.id)
