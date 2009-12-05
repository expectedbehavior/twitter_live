class Timeline < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :timelineable, :polymorphic => true
end
