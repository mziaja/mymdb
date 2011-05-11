module GenresHelper
  
  def genre_options
    options = Genre.all.collect do |genre|
      [genre.name, genre.id]
    end
  end
  
end
