class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
