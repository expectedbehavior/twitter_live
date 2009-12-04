class Tweet < ActiveRecord::Base
  belongs_to :user
  
  define_index do 
    indexes :content
    
    set_property :delta => true
  end
end
