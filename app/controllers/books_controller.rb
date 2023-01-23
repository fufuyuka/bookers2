class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def new
    @newbook = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  def index
    @newbook = Book.new
    @books = Book.all
    
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path(@book)
  end
  
  private

    def book_params
      params.require(:book).permit(:title, :body)
    end
  
    def is_matching_login_user
      user_id = params[:id].to_i
      unless user_id == current_user.id
        redirect_to user_path(current_user)
      end
    end
  
end