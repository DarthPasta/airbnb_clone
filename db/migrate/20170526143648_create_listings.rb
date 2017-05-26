class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :title 
    	t.string :location 
    	t.string :host 
    	t.string :description 
    	t.string :price

      t.timestamps
    end
  end
end
