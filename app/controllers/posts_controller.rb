class PostsController < ApplicationController
  # /users/:user_id/posts
  def index; end

  # /users/:user_id/posts/:id
  def show
    @user_id = params[:user_id].inspect
    @post_id = params[:id].inspect
  end
end
