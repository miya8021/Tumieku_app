class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = current_user.articles.page(params[:page]).per(3).order(created_at: :desc)
    # 時間を取得し合計
    @total_minutes = current_user.articles.sum(:minutes)
    @user.level = level_seting
    current_user.update(level: @user.level)
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def level_seting
    case @total_minutes
      when 0
        0
      when 1..30
        1
      when 31..60
        2
      when 61..120
        3
      when 121..180
        4
      when 181..210
        5
      when 210..270
        6
      when 271..330
        7
      when 331..390
        8
      when 391..450
        9
      when 451..510
        10
      when 511..700
        11
      when 701..900
        12
      when 901..1100
        13
      when 1101..1300
        14
      when 1301..1500
        15
      when 1501..1700
        16
      when 1701..1900
        17
      when 1901..2100
        18
      when 2101..2200
        19
      when 2201..9999
        20
    end
  end
end