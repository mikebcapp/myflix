# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create!(category_id: 1, title: "Family Guy", small_cover_url: "public/tmp/family_guy.jpg", large_cover_url: "/public/tmp/monk_large", description: "Test description - In a wacky Rhode Island town, a dysfunctional family strive to cope with everyday life as they are thrown from one crazy scenario to another.")
Video.create!(category_id: 1, title: "Futurama", small_cover_url: "tmp/futurama.jpg", large_cover_url: "tmp/monk_large", description:"Fry, a pizza guy is accidentally frozen in 1999 and thawed out New Year's Eve 2999.")
Video.create!(category_id: 2, title: "Monk", small_cover_url: "tmp/monk.jpg", large_cover_url: "tmp/monk_large", description:"Adrian Monk is a brilliant San Francisco detective, whose obsessive compulsive disorder just happens to get in the way.")
Video.create!(category_id: 2, title: "South Park", small_cover_url: "tmp/south_park.jpg", large_cover_url: "tmp/monk_large", description:"Follows the misadventures of four irreverent grade-schoolers in the quiet, dysfunctional town of South Park, Colorado.")
Video.create!(category_id: 1, title: "Family Guy", small_cover_url: "tmp/family_guy.jpg", large_cover_url: "tmp/monk_large", description: "In a wacky Rhode Island town, a dysfunctional family strive to cope with everyday life as they are thrown from one crazy scenario to another.")
Video.create!(category_id: 1, title: "Futurama", small_cover_url: "tmp/futurama.jpg", large_cover_url: "tmp/monk_large", description:"Fry, a pizza guy is accidentally frozen in 1999 and thawed out New Year's Eve 2999.")
Video.create!(category_id: 2, title: "Monk", small_cover_url: "tmp/monk.jpg", large_cover_url: "tmp/monk_large", description:"Adrian Monk is a brilliant San Francisco detective, whose obsessive compulsive disorder just happens to get in the way.")
Video.create!(category_id: 1, title: "South Park", small_cover_url: "tmp/south_park.jpg", large_cover_url: "tmp/monk_large", description:"Follows the misadventures of four irreverent grade-schoolers in the quiet, dysfunctional town of South Park, Colorado.")
Video.create!(category_id: 1, title: "Family Guy", small_cover_url: "tmp/family_guy.jpg", large_cover_url: "tmp/monk_large", description: "In a wacky Rhode Island town, a dysfunctional family strive to cope with everyday life as they are thrown from one crazy scenario to another.")
Video.create!(category_id: 2, title: "Monk", small_cover_url: "tmp/monk.jpg", large_cover_url: "tmp/monk_large", description:"Adrian Monk is a brilliant San Francisco detective, whose obsessive compulsive disorder just happens to get in the way.")



Category.create!(name: "TV Comedies")
Category.create!(name: "TV Dramas")