class Rumor < ActiveRecord::Base
  # Display most recently created first
  default_scope order('created_at DESC')

  # Mass Assignment White-Listing
  attr_accessible :author, :body, :headline
end
