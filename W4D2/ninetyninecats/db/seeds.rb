# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
CatRentalRequest.destroy_all

purrnie = Cat.create(birth_date: "1941-09-08", color: "tabby", name: "Purrnie Sanders", sex: "F", description: "Hates the one purrcent")
anne = Cat.create(birth_date: "1982-11-12", color: "gray", name: "Anne Cathaway", sex: "F", description: "I act in meowvies")
purrack = Cat.create(birth_date: "1961-08-04", color: "orange", name: "Purrack Obama", sex: "M", description: "The former purresident")
caty = Cat.create(birth_date: "1984-10-25", color: "calico", name: "Caty Purry", sex: "F", description: "A famous celepurrty")

CatRentalRequest.create(cat_id: purrnie.id, start_date: '2017-10-23', end_date: '2017-12-25')
CatRentalRequest.create(cat_id: anne.id, start_date: '2017-01-23', end_date: '2018-02-25')
CatRentalRequest.create(cat_id: purrnie.id, start_date: '2018-10-23', end_date: '2018-12-25')
CatRentalRequest.create(cat_id: purrack.id, start_date: '2009-01-20', end_date: '2017-01-20')
