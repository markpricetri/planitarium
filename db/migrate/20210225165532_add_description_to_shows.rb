class AddDescriptionToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :description, :text
  end
end
