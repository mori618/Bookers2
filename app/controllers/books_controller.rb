class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @show_user = User.find(@book.user.id)

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @show_user = User.find(current_user.id)
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
      @show_user = User.find(current_user.id)
      @new_book = Book.new
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :password, :password_confirmation)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
    redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end