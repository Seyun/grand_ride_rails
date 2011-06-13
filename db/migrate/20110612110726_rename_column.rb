class RenameColumn < ActiveRecord::Migration
  def self.up
    rename_column :rides, :passengerUuid, :passenger_uuid
  end

  def self.down
    rename_column :rides, :passenger_uuid, :passengerUuid
  end
end
