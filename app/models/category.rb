class Category < ActiveRecord::Base
  has_many :videos, -> { order("created_at DESC")}


  def recent_videos
    videos.first(6)
  end
  
  #  def recent_videos
  #   @category = Video.take(6)
  #   @category.sort_by{ |a| a.created_at }.reverse
  # end

end