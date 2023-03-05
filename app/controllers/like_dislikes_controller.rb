class LikeDislikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_counter, only: %i[get_counter]
  # first time test class variables
  @@like_count = @@dislike_count = 0

  def create_like
    @like_dislike = LikeDislike.find_or_initialize_by(like_dislike_params.merge(user_id: current_user.id))
    @@like_count = 0 if @like_dislike.new_record?
    @@like_count += 1 if action_name == "create_like"
    LikeDislike.checkLikeOrDislike(@like_dislike, @@like_count, @@dislike_count)
  end

  def create_dislike
    @like_dislike = LikeDislike.find_or_initialize_by(like_dislike_params.merge(user_id: current_user.id))
    @@dislike_count = 0 if @like_dislike.new_record?
    @@dislike_count += 1 if action_name == "create_dislike"
    LikeDislike.checkLikeOrDislike(@like_dislike, @@like_count, @@dislike_count)
  end

  def destroy
    @like_dislike = LikeDislike.find_by(video_id: params[:id])
    @like_dislike.destroy
  end

  def get_counter
    render json: @like_dislikes.to_json(include: )
  end

private
  def set_counter
    @like_dislikes = LikeDislike.all
  end

 def like_dislike_params
    params.permit(:user_id, :video_id, :likes_count, :dislikes_count, :is_liked, :is_disliked)
  end
end
