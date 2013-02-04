# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = "Jack"
Rumor.delete_all

Rumor.create(author: 'Phil', 
  headline: "Does anybody know where my red Swingline stapler went?", 
  body: "(just wondering)")

Rumor.create(author: author,
  headline: "Missing Features",
  body: "You may have read User Story II and realized some things in that have not been built yet. Or you might be a test oficionado like me, and wonder why the lines of test code don't outnumber the lines of regular code. Here are some things that would be cool to add:\n\n* Controller specs for the JSON 'rumor' resource\n\n* Integration specs showing at a MINIMUM the happy path of creating and editing rumors\n\n* Only allow editing by the creator (store ids for editable rumors in the session cookie--still maintains the simplicity of not requiring a login)\n\n* Long polling, or some means of having new items auto-populate as soon as someone else creates them server-side\n\n* Client side validations--like require the title, message, and 'your name' fields to be filled in.")

Rumor.create(author: author,
  headline: "Snarky Comments",
  body: "You might be wondering where all these snarky comments are coming from. They are loaded every night at midnight from db/seeds.rb.")

Rumor.create(author: author,
  headline: "Source Code",
  body: "Check out the source code at github.com/jackdesert/grapevine.")

Rumor.create(author: author,
  headline: "User Story I",
  body: "Louisa uses her mouse to select a separate Internet Explorer window. She notices that three new items have shown up. Sheclicks the third one down and it immediately glows, indicating that she has selected it. Meanwhile, the contents of the message show up in the right pane. She reads it and laughs--it's from her baby brother who just started working here two weeks ago. \n\nShe clicks on the next one  up, and it highlights in turn, with its content now appearing in the right pane. She notices a typo and just can't help herself so she clicks \"edit\", adds the missing character, clicks \"save\" and smiles with glee to see the revised content appear. \n\nThen she gets distracted by a stapler salesman, and leaves her cubicle.")


Rumor.create(author: author,
  headline: "User Story II",
  body: "Bill uses CTRL-T in firofox on his Ubuntu laptop and types in 'grapevine.company.com'. Th sees theree new entries. The fourth entry is highlighted, but he's already read it. He smartly hits the up-arrow key, and the next up the list highlights and displays its contents. \n\nFive seconds later, he keys through the rest, settling finally on hte first one. He reads it carefully, then CTRL-W closes the tab.")


Rumor.create(author: author,
  headline: "Kid Tested, Mother Approved",
  body: "Check out the Rspec Tests in spec/models/rumor_spec.rb.")


Rumor.create(author: author,
  headline: "Underlying Technologies",
  body: "This is running on Rails 3.2.3, with Haml, Sass, Backbone.js, jQuery, sqlite3, Rspec, FactoryGirl")

Rumor.create(author: author,
  headline: "Try it III",
  body: "Now try editing your message.")

Rumor.create(author: author,
  headline: "Try it II",
  body: "Notice that your new message popped onto the top of the list. New content always floats to the top.")

Rumor.create(author: author,
  headline: "Try it",
  body: "Try creating a new message")

Rumor.create(author: author,
  headline: "Cool Features IV",
  body: "Even if you create a new message, there is no page refresh--just a couple of AJAX calls happening in the background, posting JSON data to the server.")

Rumor.create(author: author,
  headline: "Cool Features III",
  body: "The Grapevine is built as a single page application (SPA). Which means you don't have to wait for a page reload when you click to view a message.")

Rumor.create(author: author,
  headline: "Cool Features II",
  body: "Even if you refresh the page, it remembers which ones you've read. It's storing all the ids that you've read in a cookie as a serialized array.")

Rumor.create(author: author,
  headline: "Cool Features",
  body: "Notice how the headline at your left changed to grey text when you clicked it.")

Rumor.create(author: author,
  headline: "Where Might I Use This?",
  body: "You might set up a Grapevine for your officemates, for your roommates, or for your physics study group.")
 
Rumor.create(author: author,
  headline: "Why a Grapevine?",
  body: "I was tasked with building a simple messaging system, and user authentication was not part of the requirements. To make it as real as possible, I had to find a use case where people would actually use a system that didn't require people to log in. You know--kind of like a corkboard in your living room. A grapevine always has useful tidbits of information, none of which are private, and none of which are safe from others' muddling. Therefore, I call messaging with no authentication 'A Grapevine'.")

Rumor.create(author: author,
  headline: "This is a Grapevine",
  body: "That's right--this is a grapevine. It's where you get your local news--from your colleagues, from your friends.")

