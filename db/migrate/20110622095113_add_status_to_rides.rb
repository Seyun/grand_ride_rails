class AddStatusToRides < ActiveRecord::Migration
  def self.up
    add_column :rides, :status, :integer, :default => 0
  end

  def self.down
    remove_column :rides, :status
  end
end
