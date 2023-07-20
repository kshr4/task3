class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books= @user.books#1:Nの関係

  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @users = User.all
  end


private
  def users_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
