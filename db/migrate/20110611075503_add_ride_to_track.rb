class AddRideToTrack < ActiveRecord::Migration
  def self.up
    add_column :tracks, :ride_id, :integer
  end

  def self.down
    remove_column :tracks, :ride_id
  end
end
