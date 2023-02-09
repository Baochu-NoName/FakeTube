class VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]
  before_action :set_cats
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    if params[:search_input]
      @videos = Video.includes(:thumbnail_attachment, thumbnail_attachment: :blob).search_videos(params[:search_input])
      @video_categories = Video.includes(:thumbnail_attachment, thumbnail_attachment: :blob).find_category(params[:search_input])
    else
      @videos = Video.includes(:thumbnail_attachment, thumbnail_attachment: :blob).all.order("created_at DESC")
    end
  end

  def show
    Video.update(views_count: @video.views_count + 1)
  end

  def edit
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(video_params)
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

  private
  def set_video
    @video = Video.friendly.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :thumbnail, :clip, category_ids: []) 
  end
end
