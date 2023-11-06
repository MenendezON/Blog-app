class UsersController < ApplicationController
  # /users
  def index
    @users = User.all
  end

  # /users/:id
  def show
    @user = User.find(params[:id])
  end
end
