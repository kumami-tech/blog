class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to post_path(comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:nickname, :content).merge(post_id: params[:post_id])
  end
end
