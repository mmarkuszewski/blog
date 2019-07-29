class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], per_page: 4)
    # render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
end
