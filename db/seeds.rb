# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rumor.create(headline: "Welcome to our Party", body: "Come one come all to the after-work dinner party for 42B. Friday night, 6pm, Donna's house", author: "Donna")
Rumor.create(headline: "Paint-a-thon", body: "Get your groove on with our annual spray-paint-a-thon. BYOP (duh)", author: "Doozie")
Rumor.create(headline: "Does anybody know where my red Swingline stapler went?", body: "(just wondering)", author: "Phil")
