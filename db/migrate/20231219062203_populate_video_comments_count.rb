class PopulateVideoCommentsCount < ActiveRecord::Migration[6.1]
  def up 
    Video.find_each do |video|
      Video.reset_counters(video.id, :comments)
    end
  end
end
