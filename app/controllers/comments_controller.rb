class CommentsController < ApplicationController
<<<<<<< HEAD
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

=======
  def new
    @comment = Comment.new
    @post_id = params[:id]
  end

  def create
    @comment = Comment.new(comments_param)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_post_path(id: @comment.post_id, user_id: @comment.user_id)
    else
      flash.now[:error] = 'Error: Comment could not be created!'
      render :new, locals: { comment: @comment }
    end
  end

>>>>>>> 6640f6b7b802eb5598e9fb7de6d1b37490b95fd9
  private

  def comments_param
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end