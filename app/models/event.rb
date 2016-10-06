class Event < ActiveRecord::Base

  #association
  belongs_to :artist
  has_many :users
  has_many :groups
end
