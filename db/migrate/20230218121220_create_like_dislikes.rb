class CreateLikeDislikes < ActiveRecord::Migration[6.1]
  def change
    create_table :like_dislikes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true
      t.integer :likes_count, default: 0
      t.integer :dislikes_count, default: 0
      t.boolean :is_liked, default: false
      t.boolean :is_disliked, default: false

      t.timestamps
    end
  end
end
