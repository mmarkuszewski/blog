class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  before_action :current_post

  def new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_url
  end

  def post_params
    params[:post][:picture].open if params[:post][:picture]
    params.require(:post).permit(:title, :content, :picture)
  end

  def current_post
    @post = params[:id] ? Post.find(params[:id]) : Post.new
  end

end

