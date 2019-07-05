class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.paginate(page: params[:page], per_page: 4)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
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
    params[:post][:picture].open
    params.require(:post).permit(:title, :content, :picture)
  end

end
