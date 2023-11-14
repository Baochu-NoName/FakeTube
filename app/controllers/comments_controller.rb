class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[post_comment]

    def video_comment
        @comment = current_user.comments.new(comment_params)
        if @comment.save
            redirect_to video_path(params[:video_id])
        else
          flash[:notice] = @comment.errors.full_messages.to_sentence
        end
    end

    def delete_comment
      @comment = Comment.find(params[:comment_id])
      @comment.delete
      redirect_to video_path(params[:id])
    end

    private
    def comment_params
        @video = Video.friendly.find(params[:video_id])
        params.require(:comment).permit(:body, :parent_id).merge(video_id: @video.id)
    end
end
