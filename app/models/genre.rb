class Genre < ActiveRecord::Base
  
  has_many :films, :dependent => :destroy
  
  attr_accessible :name
end
