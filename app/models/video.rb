class Video < ApplicationRecord
	has_one_attached :clip
	has_one_attached :thumbnail
	has_many :video_categories
	has_many :categories, through: :video_categories
	scope :search_videos, -> (search) {where('title ILIKE ? OR description ILIKE ?', "%#{search}%",  "%#{search}%")  if search.present?}

	def self.find_category(search_input)
		categories = Category.all.where('name ILIKE ?', "%#{search_input}%")
		if categories
		  categories.each do |cat|
			@videos_cat = cat.videos
		  end
		end
	end
end
