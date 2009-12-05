class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :timelines
  
  after_save :write_to_timeline
  
  define_index do 
    indexes :content
    
    set_property :delta => true
  end
  
  def write_to_timeline
    self.user.stalkers.each do |s|
      s.timeline << Timeline.create(:tweet => self, :timelineable => self.user)
    end 
  end
end
