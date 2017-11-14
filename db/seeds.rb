# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.create(title: "Pick a fullstack project",
            body: "Probably Bandcamp",
            done: false
          )
Todo.create(title: "Learn Redux.",
            body: "Seriously. Learn it.",
            done: false
          )
Todo.create(title: "Rest up.",
            body: "You'll need it to learn.",
            done: true
          ) 
