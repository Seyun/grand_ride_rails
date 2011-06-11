class CreateRideMonitors < ActiveRecord::Migration
  def self.up
    create_table :ride_monitors do |t|
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :ride_monitors
  end
end
