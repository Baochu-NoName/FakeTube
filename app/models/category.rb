class Category < ApplicationRecord
    has_many :video_categories, counter_cache: true
    has_many :videos, through: :video_categories
end
