class CommentsController < ApplicationController


  def create
    comment = Comment.new(comment_params)
    #zawsze redirect bo walidacja komentarza polega tylko na tym czy istnieje
    redirect_to post_path(params[:post_id]) if comment.save
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |f|
      f.html { redirect_to post_url }
      f.js
    end
  end

  def update
    comment = Comment.find(params[:id])
    post_id = comment.post_id
    comment.update_attributes(content: params[:comment][:content])
    redirect_to post_path(post_id)

  end

  def destroy
    comment = Comment.find(params[:id])
    post_id = comment.post_id
    comment.destroy
    redirect_to post_path(post_id)
  end

  def comment_params
    {user_id: session[:user_id], post_id: params[:post_id],content: params[:post][:comment][:content]}
  end

end
