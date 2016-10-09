class Group < ActiveRecord::Base

  #association
  belongs_to :artist
  has_many :users
  belongs_to :event

end
