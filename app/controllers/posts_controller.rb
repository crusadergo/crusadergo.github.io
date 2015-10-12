class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at DESC')

    respond_to do |format|
      format.html {  }
      format.json  { render json: @posts }
      end
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end

  private

  def post_params
    params.permit(:author, :title, :text)
  end

end
