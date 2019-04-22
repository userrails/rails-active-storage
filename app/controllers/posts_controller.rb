class PostsController < ApplicationController
  def index
    @posts = Post.all.with_attached_images
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    @post.images.attach(params[:post][:images])
    redirect_to post
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, images: [])
  end
end
