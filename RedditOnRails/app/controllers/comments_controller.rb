class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: comment_params[:post_id])
    @comment.save
    flash[:errors] = ["Wrong parameters"] unless @comment.save
    redirect_to post_url(@post)
  end

  def comment_params
    parset = params.require(:comment).permit(:content, :post_id, :parent_comment_id)
    parset
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post_id
    @comment.destroy
    redirect_to post_url(@post)
  end
end
