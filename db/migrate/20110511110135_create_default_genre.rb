class CreateDefaultGenre < ActiveRecord::Migration
  def self.up
    genre = Genre.create!(:name => "default")
    Film.all.each do |film|
      genre.films << film
    end
  end

  def self.down
    raise ActiveRecord::IrreversableMigration 
  end
end
