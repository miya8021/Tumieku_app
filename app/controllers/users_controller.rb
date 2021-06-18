class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = current_user.articles.page(params[:page]).per(5).order(created_at: :desc)
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end