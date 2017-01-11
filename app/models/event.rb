class Event < ActiveRecord::Base

  validates :event_name, presence: true
  validates :event_location, presence: true
  validates :event_date, presence: true

  #association
  has_many :artists
  belongs_to :artist
  has_many :clips
  has_many :users, through: :clips
  has_many :groups
end
