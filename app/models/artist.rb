class Artist < ActiveRecord::Base

  validates :artist_name, presence: true, uniqueness: true
  validates :artist_name_japanese, presence: true
  validates :artist_image_url, presence: true
  validates :artist_url, presence: true, uniqueness: true

  #assosiation
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :events, dependent: :destroy
  has_many :groups
end
