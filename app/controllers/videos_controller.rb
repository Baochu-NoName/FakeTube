class VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]
  before_action :set_cats
  def index
    if params[:search_input]
      @videos = Video.search_videos(params[:search_input])
      @video_categories = Video.includes(:video_categories, :videos).find_category(params[:search_input])
    else
      @videos = Video.all.order("created_at DESC")
    end 
  end

  def show
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
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :thumbnail, :clip, category_ids: []) 
  end
end
