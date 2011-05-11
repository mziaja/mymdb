class Film < ActiveRecord::Base
  
  before_validation :clean_url
  
  belongs_to :genre
  
  validates_presence_of :name, :url, :description
  validates_numericality_of :rating, :greater_than => -1, :less_than => 6 
  # attr_accessible :name, :url, :description, :rating
  
  private 
  def clean_url
    self.url.gsub!("http://",'') if self.url
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

