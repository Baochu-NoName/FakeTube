class AddCommentsCountToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :comments_count, :integer
  end
end
