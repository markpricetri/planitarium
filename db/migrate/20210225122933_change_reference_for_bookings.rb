class ChangeReferenceForBookings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :show, foreign_key: true
    add_reference :bookings, :showing, foreign_key: true
  end
end
