class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :artist_id
      t.string :artist_name
      t.string :artist_name_japanese
      t.text :artist_image_url
      t.text :artist_url
      t.timestamps null: false
    end
  end
end
