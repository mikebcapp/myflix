class Video < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, presence: true

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
  end

  def self.recent_videos
    @recent = Video.take(6)
    @recent.sort_by{ |a| a.created_at }.reverse 
  end
end