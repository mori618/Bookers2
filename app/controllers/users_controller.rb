class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @current_user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def edit
    @show_user = User.find(current_user.id)
    @new_book = Book.new
    @user = User.find(params[:id])
    @user_update = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to book_path
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :password, :password_confirmation)
  end

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
