class Notifier < ActionMailer::Base
  def checked_in(ride)
    @greeting = "Hi"
    @ride = ride
    ride.ride_monitors.each do |monitor|
      mail :to => monitor.email
    end
  end

  def checked_out(ride)
    @ride = ride
    ride.ride_monitors.each do |monitor|
      mail :to => monitor.email
    end
  end
end