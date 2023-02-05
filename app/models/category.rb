class Category < ApplicationRecord
    has_many :video_categories
    has_many :videos, through: :video_categories
    has_many :sub_categories
end
