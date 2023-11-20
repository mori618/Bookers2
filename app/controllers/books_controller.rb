class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "successfully"
    redirect_to books_path
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :password, :password_confirmation)
  end

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end