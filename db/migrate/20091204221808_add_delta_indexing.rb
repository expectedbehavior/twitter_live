class AddDeltaIndexing < ActiveRecord::Migration
  def self.up
    add_column "tweets", :delta, :boolean, :default => true
    add_column "users", :delta, :boolean, :default => true
  end

  def self.down
  end
end
