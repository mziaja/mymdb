class FilmsController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:index, :show]
  
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(params[:film])
    if @film.save
      redirect_to @film, :notice => "Successfully created film."
    else
      render :action => 'new'
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    if @film.update_attributes(params[:film])
      redirect_to @film, :notice  => "Successfully updated film."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to films_url, :notice => "Successfully destroyed film."
  end
end
