class HomeController < ApplicationController
  before_action :authenticate_user!

  # 締切日が今日でプロジェクトの依存関係は問わないタスク一覧
  def index
  end

  # 締切日とプロジェクトが未定のタスク一覧
  def inbox
    
  end

  # 締切日が今日以外で、プロジェクトの依存関係は問わないタスク一覧
  def future
  end

end
