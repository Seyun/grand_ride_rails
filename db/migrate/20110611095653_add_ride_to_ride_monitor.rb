class AddRideToRideMonitor < ActiveRecord::Migration
  def self.up
    add_column :ride_monitors, :ride_id, :integer
  end

  def self.down
    remove_column :ride_monitors, :ride_id
  end
end
