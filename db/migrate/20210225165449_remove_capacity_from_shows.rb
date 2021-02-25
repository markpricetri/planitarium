class RemoveCapacityFromShows < ActiveRecord::Migration[6.0]
  def change
    remove_column :shows, :capacity, :integer
  end
end
