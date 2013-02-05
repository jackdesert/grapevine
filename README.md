
Grapevine
=========

by Jack Desert <jackdesert@gmail.com>

This is a grapevine. It's where you get your local news--from your colleagues, from your friends.


Why a Grapevine?
----------------

I was asked to build a simple message board, and user authentication was not part of the requirements. To make it as real as possible, I had to find a use case where people would actually use a system that didn't require people to log in. You know--kind of like a corkboard in your living room. 

A grapevine always has useful tidbits of information, none of which are private, and none of which are safe from others' muddling. Therefore, I call messaging with no authentication A *Grapevine*.

Where can I see it in Action?
-----------------------------

There is a [live Grapevine demo](http://grapevine.jackdesert.com) that has its contents reset every night at midnight.

Underlying Technologies
-----------------------

* Backbone.js
* jQuery
* Rails 3.2.3
* Haml
* Sass
* sqlite3
* Rspec
* FactoryGirl

Cool Features
-------------

* The Grapevine is built as a single page application (SPA). Which means you don't have to wait for a page reload when you click to view a message.
* Even if you create a new message, there is no page refresh--just a couple of Backbone.js AJAX calls happening in the background, posting JSON data to the server.
* Keeps track of what you've read--even if you do reload the page. It's storing all the ids that you've read in a cookie as a serialized array. See app/controllers/rumors_controller.rb for the details.

Where Might I Use This?
-----------------------

You might set up a Grapevine for your officemates, for your roommates, or for your physics study group.


User Stories
------------

These user stories helped shape the Grapevine into its current form.

### Louisa

Louisa uses her mouse to select a separate Internet Explorer window. She notices that three new items have shown up. Sheclicks the third one down and it immediately glows, indicating that she has selected it. Meanwhile, the contents of the message show up in the right pane. She reads it and laughs--it's from her baby brother who just started working here two weeks ago. 

She clicks on the next one  up, and it highlights in turn, with its content now appearing in the right pane. She notices a typo and just can't help herself so she clicks *edit* adds the missing character, clicks *save* and smiles with glee to see the revised content appear. 

Then she gets distracted by a stapler salesman, and leaves her cubicle.

### Bill

Bill uses CTRL-T in firefox on his Ubuntu laptop and types in 'grapevine.company.com'. Th sees theree new entries. The fourth entry is highlighted, but he's already read it. He smartly hits the up-arrow key, and the next up the list highlights and displays its contents. 

Five seconds later, he keys through the rest, settling finally on hte first one. He reads it carefully, then CTRL-W closes the tab.

Missing Features
----------------

You may have read user story *Bill* and realized some things in that have not been built yet. Or you might be a test oficionado like me, and wonder why the lines of test code don't outnumber the lines of regular code. Here are some things that would be cool to add:

* Controller specs for the JSON *rumor* resource
* Integration specs showing at a MINIMUM the happy path of creating and editing rumors
* Only allow editing by the creator (store ids for editable rumors in the session cookie--still maintains the simplicity of not requiring a login)
* Long polling, or some means of having new items auto-populate as soon as someone else creates them server-side
* Client side validations--like require the title, message, and 'your name' fields to be filled in.

Famous Message
--------------

Does anybody know where my red Swingline stapler went? 
(just wondering)


