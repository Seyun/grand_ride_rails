class Notifier < ActionMailer::Base
  default :from => "support@ppassa.com"
  def checked_in(ride)
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
