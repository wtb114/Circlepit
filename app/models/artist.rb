class Artist < ActiveRecord::Base
  #assosiation
  has_many :users
  has_many :events
  has_many :groups
end
