class SearchController < ApplicationController
  
  def create
    search = "%#{params[:search_for]}%"
    @films = Film.find(:all, :conditions => ['name LIKE ?', search])
  end
  
end