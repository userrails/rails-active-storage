class ImagesController < ApplicationController
  before_action :get_post

  def destroy
    image = @post.images.find(params[:id])
    image.purge
    redirect_to posts_path
  end


  private

  def get_post
    @post = Post.find(params[:post_id])
  end
end
