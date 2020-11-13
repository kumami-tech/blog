class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to post_comments_path(comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
