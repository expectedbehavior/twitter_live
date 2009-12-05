class Tweet < ActiveRecord::Base
  belongs_to :user
  
  define_index do 
    indexes :content
    
    set_property :delta => true
  end

  def self.trends(options = {})
    default_options = { 
      :start_time => 1.minute.ago
    }
    options = options.dup
    options.reverse_merge!(default_options)
    
    trending_tweets = Tweet.find(:all, :conditions => {:created_at => options[:start_time]..1.day.from_now})
    

    
    trend_count = {}
    trending_tweets.each do |tweet|
      tags = tweet.content.split(" ").select {|word| word =~ /^#/ }
      tags.each do |t|
        trend_count[t] ||= 0
        trend_count[t] +=  1
      end
    end
    
    sorted_trend_count = trend_count.sort {|a,b| b[1] <=> a[1] }
    sorted_trend_count[0..9].map {|x| x[0] }
    
    
  end

end
