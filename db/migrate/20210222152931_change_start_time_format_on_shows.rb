class ChangeStartTimeFormatOnShows < ActiveRecord::Migration[6.0]
  def change
    remove_column :shows, :start_time, :time
    add_column :shows, :start_time, :integer
  end
end
