class LikeDislike < ApplicationRecord
  belongs_to :user
  belongs_to :video

  def self.checkLikeOrDislike(like_or_dislike, like_counter, dislike_counter)
    if like_or_dislike.likes_count == 0 && like_counter == 1
      like_or_dislike.update(likes_count: like_or_dislike.likes_count + 1, is_liked: true)
      like_or_dislike.update(dislikes_count: like_or_dislike.dislikes_count - 1, is_disliked: false) if like_or_dislike.dislikes_count != 0
    elsif like_or_dislike.dislikes_count == 0 && dislike_counter == 1
       like_or_dislike.update(dislikes_count: like_or_dislike.dislikes_count + 1, is_disliked: true) 
       like_or_dislike.update(likes_count: like_or_dislike.likes_count - 1, is_liked: false) if like_or_dislike.likes_count != 0
    elsif (like_counter - dislike_counter).abs == 2 
        like_or_dislike.destroy
    end
  end
end
