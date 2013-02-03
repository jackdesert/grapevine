require 'spec_helper'

describe Rumor do
  before(:each) do
    Rumor.delete_all
  end

  it "creates a rumor" do
    a = FactoryGirl.build(:rumor)
    a.already_read.should be_nil
    a.mark_as_read
    a.already_read.should be_true
  end

  it "keeps track of already_read" do
    a = FactoryGirl.build(:rumor)
    a.as_json[:already_read].should be_nil
    a.mark_as_read
    a.as_json[:already_read].should be_true
  end

  it "can give me a list of all rumors with read attributes set" do
    3.times do 
      FactoryGirl.create(:rumor)
    end
    all_rumors = Rumor.all_with_already_read_attribute_set([2])
    all_rumors.select{|f| f.id == 1}.first.already_read.should be_nil
    all_rumors.select{|f| f.id == 2}.first.already_read.should be_true
    all_rumors.select{|f| f.id == 3}.first.already_read.should be_nil
  end
end
