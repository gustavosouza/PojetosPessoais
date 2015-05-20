class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, notice: "Post successfuly updated"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to :root
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:content)
  end
end