class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video, counter_cache: true
  has_rich_text :body
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :comments, foreign_key: :parent_id
end
