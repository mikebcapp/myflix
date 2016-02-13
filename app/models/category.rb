class Category < ActiveRecord::Base
  has_many :videos


  def recent_videos
    @recent = Video.take(6)
    @recent.sort_by{ |a| a.created_at }.reverse
  end

end