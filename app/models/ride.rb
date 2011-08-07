class Ride < ActiveRecord::Base
  CHECKED_IN = 1
  CHECKED_OUT = 2
  
  has_many :tracks, :dependent => :destroy
  has_many :ride_monitors, :dependent => :destroy

  accepts_nested_attributes_for :tracks, :allow_destroy => true
  accepts_nested_attributes_for :ride_monitors, :allow_destroy => true

end
