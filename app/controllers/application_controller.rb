class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    home_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # メールアドレスのアカウント名の部分のみを抽出
  def get_username_from_email
    arr_email = current_user.email.rpartition("@")
    @user_name = arr_email[0]
  end
end
