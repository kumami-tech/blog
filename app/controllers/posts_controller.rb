class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, except: %i[index new create]

  def index
    @posts = Post.includes(:user).sorted
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = '投稿しました。'
      redirect_to post_path(@post)
    else
      flash[:alert] = '入力に不備があります。'
      render "new"
    end
  end

  def show
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.sorted
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = '投稿を編集しました。'
      redirect_to post_path(@post)
    else
      flash[:alert] = '入力に不備があります。'
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = '投稿を削除しました。'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
