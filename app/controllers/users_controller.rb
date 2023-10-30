class UsersController < ApplicationController
  # /users
  def index
  end

  # /users/:id
  def show
    @id = params[:id].inspect
  end
end