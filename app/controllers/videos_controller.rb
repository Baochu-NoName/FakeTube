class VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]
  before_action :set_cats
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    if params.has_key?(:search_input)
      videos = Video.includes(thumbnail_attachment: :blob).search_videos(params[:search_input])
      @videos = Kaminari.paginate_array(videos).page(params[:video_page]).per(6)
    elsif params.has_key?(:search_by_category)
      videos_cat = Video.includes(thumbnail_attachment: :blob).find_category(params[:search_by_category])
      # By default Kaminari provides an Array wrapper class that adapts a generic Array object to the paginate view helper. However, the paginate helper doesn't automatically handle your Array object (this is intentional and by design). Kaminari::paginate_array method converts your Array object into a paginatable Array that accepts page method.
      @videos = Kaminari.paginate_array(videos_cat).page(params[:video_page]).per(6)
    else 
      @video_trailers = VideoCategory.all.where(category_id: 6).limit(12)
      @video_top_rated_limit = Video.all.order(views_count: :desc).limit(12)
      @video_most_commented_limit = Video.all.order(comments_count: :desc).limit(12)
    end
    @video_limit = Video.includes(thumbnail_attachment: :blob).all.order("created_at ASC").limit(12)
  end

  def show
    if current_user.present?
      Video.includes(:user).update(views_count: @video.views_count + 1) if !current_user.admin?
    end
    if user_signed_in?
      @like_dislike = @video.like_dislikes.find_by(user_id: current_user.id, video_id: @video.id)     
      @is_liked =  @like_dislike.is_liked? if @like_dislike
      @is_disliked = @like_dislike.is_disliked? if @like_display
    else
      @is_liked = @is_disliked = false
    end

    @total_likes_count = LikeDislike.count_total_likes(@video.id)
    @total_dislikes_count = LikeDislike.count_total_dislikes(@video.id) 
    # Get video duration
    # @get_duration = ActiveStorage::Analyzer::VideoAnalyzer.new(@video.clip.blob).metadata[:duration]
  end

  def edit
    redirect_to root_path, 
    notice: "You cannot edit this video 
              because you don't own it." if(params[:action] == "edit" &&
                                           current_user.id != @video.user_id &&
                                           !current_user.admin?)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(video_params.merge(user_id: current_user.id))
    if @video.save
      redirect_to @video, notice:"Video was successfully created"
    else
      render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: "Video was successfully updated"
    else
      render :edit
    end
  end

  def destroy 
  end

  private
  def set_video
    @video = Video.friendly.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :thumbnail, :clip, :release_date, :age_restricted, :user_id, category_ids: []) 
  end
end
