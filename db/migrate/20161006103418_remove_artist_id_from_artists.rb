class RemoveArtistIdFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :artist_id, :integer
  end
end
