class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :current_post

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end

  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |f|
      f.html { redirect_to post_url }
      f.js
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    @comment.update_attributes(content: params[:comment][:content])
    redirect_to post_path(@post.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(@post.id)
  end

  def comment_params
    {user_id: current_user.id, content: params[:post][:comment][:content]}
  end

  def current_post
    @post ||= Post.find(params[:post_id])
  end
end
