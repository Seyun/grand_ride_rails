class Ride < ActiveRecord::Base
  has_many :tracks,         :dependent => :destroy
  has_many :ride_monitors,  :dependent => :destroy

end
