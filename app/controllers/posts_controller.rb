class PostsController < ApplicationController
  # /users/:user_id/posts
  def index
    @posts = Post.where(author_id: params[:user_id])
  end

  # /users/:user_id/posts/:id
  def show
    @post = Post.find(params[:id])
  end
end
