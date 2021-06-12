class HomeController < ApplicationController
  before_action :authenticate_user!

  # ログイン後のページ
  def index
  end

end
