class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:nickname, :content).merge(post_id: params[:post_id])
  end
end
