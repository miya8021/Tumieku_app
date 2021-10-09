class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    sign_in User.guest
    redirect_to articles_path(id: current_user.id), notice: 'ゲストユーザーとしてログインしました。'
  end
end