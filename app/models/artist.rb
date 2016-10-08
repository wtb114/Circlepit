class Artist < ActiveRecord::Base
  #assosiation
  has_many :favorites
  has_many :users, through: :favorites
  has_many :events
  has_many :groups
end
