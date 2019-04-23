class PostsController < ApplicationController
  before_action :get_post, only: [:show]

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
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, images: [])
  end
end
