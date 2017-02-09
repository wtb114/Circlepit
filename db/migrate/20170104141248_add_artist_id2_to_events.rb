class AddArtistId2ToEvents < ActiveRecord::Migration
  def change
    add_column :events, :artist_id2, :integer
  end
end
