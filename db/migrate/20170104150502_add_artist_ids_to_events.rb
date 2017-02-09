class AddArtistIdsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :artist_id3, :integer
    add_column :events, :artist_id4, :integer
    add_column :events, :artist_id5, :integer
    add_column :events, :artist_id6, :integer
    add_column :events, :artist_id7, :integer
    add_column :events, :artist_id8, :integer
    add_column :events, :artist_id9, :integer
    add_column :events, :artist_id10, :integer
  end
end
