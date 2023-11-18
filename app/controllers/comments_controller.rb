class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = current_user.comment.build
  end

  private

  def comments_param
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
