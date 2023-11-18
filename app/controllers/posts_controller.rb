class PostsController < ApplicationController

  def index
    set_user
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @posts = @posts.paginate(page: params[:page], per_page: 3)
  end

  # /users/:user_id/posts/:id
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      flash[:success] = 'Post created successfully!'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Error: Post could not be created!'
      render :new, locals: { post: @post }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
