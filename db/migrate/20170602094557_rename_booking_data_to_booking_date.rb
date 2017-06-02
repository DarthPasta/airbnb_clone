class RenameBookingDataToBookingDate < ActiveRecord::Migration[5.1]
  def change
  	rename_column :reservations, :booking_data, :booking_date
  end
end
