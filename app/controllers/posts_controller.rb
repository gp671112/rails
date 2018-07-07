class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    attrs = params.require(:post).permit(:title, :content)
    @post = Post.new(attrs)

    if @post.save
      redirect_to posts_path, notice: "新增完成"
    else
      render :new
    end
  end

  def edit
  end

  def update
    attrs = params.require(:post).permit(:title, :content)

    if @post.update_attributes(attrs)
      redirect_to posts_path, notice: "修改完成"
    else
      @post = post
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "刪除完成"
  end

  private def find_post
    @post = Post.find(params[:id])
  end
end
