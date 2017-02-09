class Favorite < ActiveRecord::Base

  validates :user_id, :uniqueness => {:scope => :artist_id}

    belongs_to :user
    belongs_to :artist
end
