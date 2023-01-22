class UsersController < ApplicationController
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @books = Book.find(current_user)
  end

  def edit
  end
  
end
