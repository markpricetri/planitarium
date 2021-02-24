class AddAddressToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :address, :string
  end
end
