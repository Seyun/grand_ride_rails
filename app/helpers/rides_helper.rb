module RidesHelper
  def add_ride_monitor_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :ride_monitors, :partial => 'ride_monitor', :object => RideMonitor.new
    end
  end
end
