# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Ale Sab", email: "a@s.com", password: "password")
User.create(username: "moxamox", email: "m@m.com", password: "password")
User.create(username: "DJ Six", email: "d@six.com", password: "password")

Record.create(artist: "Peshka", title: "Mood EP", label: "Re Face Italy", format: "12in", released: "2018-10-02", genre: "Minimal/Tech House")
Record.create(artist: "Lee Burton", title: "FH 12", label: "Finest Hour", format: "12in", released: "2018-09-21", genre: "Minimal/Tech House")
Record.create(artist: "Huerta", title: "Drunk Mystic EP", label: "Oscillat Music", format: "180 gram vinyl 12in", released: "2018-09-17", genre: "Minimal/Tech House")
