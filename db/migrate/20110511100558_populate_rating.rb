class PopulateRating < ActiveRecord::Migration
  def self.up
    Film.all.each do |film|
      film.update_attribute(:rating, 0) unless film.rating
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
