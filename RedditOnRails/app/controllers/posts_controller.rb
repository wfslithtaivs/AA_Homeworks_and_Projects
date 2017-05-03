class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end

  def update
    @post = Post.find(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def index
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments.where(parent_comment_id: nil)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments.where(parent_comment_id: nil)
  end

  def destroy
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end
end
