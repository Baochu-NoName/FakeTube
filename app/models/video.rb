class Video < ApplicationRecord
	has_one_attached :clip
	has_one_attached :thumbnail
	has_many :video_categories, dependent: :destroy
	has_many :categories, through: :video_categories
    has_many :like_dislikes, dependent: :destroy
	has_many :comments
	belongs_to :user
    scope :search_videos, -> (search) {joins(:categories).references(:categories).where('title ILIKE ? OR videos.description ILIKE ? OR categories.name ILIKE ?', "%#{search}%",  "%#{search}%", "%#{search}%").distinct if search.present?}

	extend FriendlyId
	friendly_id :title
	
	def self.find_category(search_by_cat)
      @category = Category.find_by('name ILIKE ?', "%#{search_by_cat}%") if search_by_cat.present?
		if @category
		  @category.videos.includes(thumbnail_attachment: :blob).each do |video|
            where('id ILIKE ?', "%#{video.id}%") 
		  end
		end
	end
end
