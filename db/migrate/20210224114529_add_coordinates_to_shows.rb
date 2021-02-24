class AddCoordinatesToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :latitude, :float
    add_column :shows, :longitude, :float
  end
end
