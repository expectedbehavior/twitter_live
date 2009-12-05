class CreateDirectMessages < ActiveRecord::Migration
  def self.up
    create_table :direct_messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :direct_messages
  end
end
