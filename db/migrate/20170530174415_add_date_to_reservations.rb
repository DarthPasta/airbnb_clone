class AddDateToReservations < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservations, :booking_data, :date
  end
end
