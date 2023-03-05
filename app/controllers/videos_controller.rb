class VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]
  before_action :set_cats
  before_action :authenticate_user!, only: %i[new edit update destroy]
  def index
    if params[:search_input] 
      @videos = Video.includes(thumbnail_attachment: :blob).search_videos(params[:search_input])
    elsif !params[:search_by_category]
      @videos = Video.includes(thumbnail_attachment: :blob).all.order("created_at DESC")
    end
      @video_categories = Video.includes(thumbnail_attachment: :blob).find_category(params[:search_by_category]) if params[:search_by_category]
  end

  def show
    if current_user.present?
      Video.update(views_count: @video.views_count + 1) if !current_user.admin?
    end

    like = @video.like_dislikes.find_by(user_id: current_user.id, video_id: @video.id) if user_signed_in?
    @is_liked = like.is_liked if like.present?
    @is_disliked = like.is_disliked if like.present?
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
new
  def update
    if @video.update(video_params)
      redirect_to @video, notice: "Video was successfully updated"
    else
      render :edit
    end
  end
  
  private
  def set_video
    @video = Video.friendly.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :thumbnail, :clip, :age_restricted, :user_id, category_ids: []) 
  end
end
