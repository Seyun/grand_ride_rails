class Notifier < ActionMailer::Base
  default :from => "grandride@ppassa.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.checked_in.subject
  #
  def checked_in(ride)
    @greeting = "Hi"
    @ride = ride
    ride.ride_monitors.each do |monitor|
      mail :to => monitor.email
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.checked_out.subject
  #
  def checked_out
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
