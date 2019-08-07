module Admin
  class PostsController < ApplicationController
    load_and_authorize_resource
    before_action :current_post

    def new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def edit
      render json: @post
    end

    def update
      if @post.update_attributes(post_params)
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def destroy
      Post.find(params[:id]).destroy
    end

    def post_params
      params[:post][:picture].open if params[:post][:picture]
      params.require(:post).permit(:title, :content, :picture)
    end

    def current_post
      @post = params[:id] ? Post.find(params[:id]) : Post.new
    end

  end
end
