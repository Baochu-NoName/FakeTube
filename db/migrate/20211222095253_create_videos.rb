class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.boolean :age_restricted, default: false

      t.timestamps
    end
  end
end
