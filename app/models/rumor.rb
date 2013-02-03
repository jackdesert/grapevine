class Rumor < ActiveRecord::Base

  # Display most recently created first
  default_scope order('created_at DESC')

  # Mass Assignment White-Listing
  attr_accessible :author, :body, :headline

  attr_accessor :already_read


  def read?
    already_read
  end

  def mark_as_read
    self.already_read = true
  end


  def self.all_with_already_read_attribute_set(list_of_ids)
    list_of_ids.map!{|id| id.to_i}
    all_rumors = []
    self.find_each do |rumor|
      rumor.mark_as_read if list_of_ids.include? rumor.id
      all_rumors << rumor
    end
    all_rumors
  end


  def as_json(options={})
    rr = super(options)
    rr[:already_read] = self.already_read
    rr
  end


end
