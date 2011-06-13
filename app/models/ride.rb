class Ride < ActiveRecord::Base
  has_many :tracks,         :dependent => :destroy
  has_many :ride_monitors,  :dependent => :destroy

  def ride_monitor_attributes=(ride_monitor_attributes)
    ride_monitor_attributes.each do |attributes|
      ride_monitors.build(attributes)
    end
  end
end
