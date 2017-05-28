class RemoveReservationIdFromListings < ActiveRecord::Migration[5.1]
  def change
  	  remove_column :listings, :reservation_id

  end
end
