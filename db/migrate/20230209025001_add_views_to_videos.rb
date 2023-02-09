class AddViewsToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :views_count, :integer, default: 0
  end
end
