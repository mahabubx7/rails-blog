class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: %i[index show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    @post.destroy

    respond_to do |format|
      format.html { redirect_to "/users/#{params[:user_id]}/posts", notice: 'Post was destroyed successfully.' }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
