class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to tweet_path(params[:tweet_id])  }
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:nickname, :content).merge(post_id: params[:post_id])
  end
end
