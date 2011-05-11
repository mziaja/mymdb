class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      redirect_to @genre, :notice => "Successfully created genre."
    else
      render :action => 'new'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      redirect_to @genre, :notice  => "Successfully updated genre."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_url, :notice => "Successfully destroyed genre."
  end
end
