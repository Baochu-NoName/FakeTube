class AddReleaseDateToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :release_date, :datetime
  end
end
