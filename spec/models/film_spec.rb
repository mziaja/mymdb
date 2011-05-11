require File.dirname(__FILE__) + '/../spec_helper'

describe Film do
  it "should not be valid" do
    Film.new.should_not be_valid
  end
  
  it "should be valid with a name, url & description" do
     film = Factory(:film, :name => "test", :url => "test", :description => "test", :rating => 0)
     film.should be_valid
  end
   
  describe 'cleaning the url' do
    it 'should clean the leading http:// when saved' do
      film = Factory(:film, :url => "http://some/url")
      film.save!
      film.url.should == "some/url"
    end
    
    it 'should not clean the leading characters when there is no http://' do
      film = Factory(:film, :url => "some/url")
      film.save!
      film.url.should == "some/url"
    end
    
    it 'should do nothing when url is nil' do
       film = Factory.build(:film, :url => nil)
       film.valid?
       film.url.should be_nil
    end
  end
  
  describe 'ratings' do
    it 'should be valid when rating is 0 to 5' do
      (0..5).each do |rating|
        film = Factory.build(:film, :rating => rating)
        film.valid?.should be_true
      end
    end
    
    it 'should not be valid when rating is -1' do
      film = Factory.build(:film, :rating => -1)
      film.valid?.should be_false
      film.errors_on(:rating).should == ["must be greater than -1"]
    end
    
    it 'should not be valid when rating is 6' do
      film = Factory.build(:film, :rating => 6)
      film.valid?.should be_false
      film.errors_on(:rating).should == ["must be less than 6"]
    end
     
  end
   
end



# == Schema Information
#
# Table name: films
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  rating      :integer
#

