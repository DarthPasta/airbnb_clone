class CreateTaggables < ActiveRecord::Migration[5.1]
  def change
    create_table :taggables do |t|
      t.integer :listing_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
