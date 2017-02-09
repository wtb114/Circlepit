class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, null:false
      t.references :artist, null:false
      t.timestamps null: false
    end

    add_index :favorites, :user_id
    add_index :favorites, :artist_id
  end
end
