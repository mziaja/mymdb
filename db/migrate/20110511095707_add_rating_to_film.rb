class AddRatingToFilm < ActiveRecord::Migration
  def self.up
    add_column :films, :rating, :integer
  end

  def self.down
    remove_column :films, :rating
  end
end