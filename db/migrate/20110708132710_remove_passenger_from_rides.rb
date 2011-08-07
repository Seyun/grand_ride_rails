class RemovePassengerFromRides < ActiveRecord::Migration
  def self.up
    remove_column :rides, :passenger_uuid
  end

  def self.down
    add_column :rides, :passenger_uuid, string 
  end
end
