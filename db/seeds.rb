# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Style.create([{title: "Traditional"}, {title: "Transitional"}, {title: "Contemporary"}])
Medium.create([{title: "Acrylic"}, {title: "Oil"}])
Sort.create([{title: "Fine Art A-Z", value: "title ASC"}, {title: "Fine Art Z-A", value: "title DESC"}, {title: "Artist A-Z", value: "artist_last ASC"}, {title: "Artist Z-A", value: "artist_last DESC"}, {title: "JTG#", value: "jtg ASC"}])

Artist.create(first_name: "Lisa", last_name: "Rochi")
Artist.create(first_name: "Tom", last_name: "Haverford")
Subject.create(title: "Dog")
Subject.create(title: "Glasses")
Subject.create(title: "Flowers")
Location.create(title: "Cape Cod")
Location.create(title: "Paris")
Keyword.create(title: "happy")
Keyword.create(title: "night life")