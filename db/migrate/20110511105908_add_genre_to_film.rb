class AddGenreToFilm < ActiveRecord::Migration
  def self.up
    add_column :films, :genre_id, :integer
  end

  def self.down
    remove_column :films, :genre_id
  end
end