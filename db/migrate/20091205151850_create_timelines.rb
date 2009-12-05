class CreateTimelines < ActiveRecord::Migration
  def self.up
    create_table :timelines do |t|
      t.integer :timelineable_id
      t.string :timelineable_type
      t.integer :tweet_id

      t.timestamps
    end
  end

  def self.down
    drop_table :timelines
  end
end
