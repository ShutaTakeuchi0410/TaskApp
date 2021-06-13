class HomeController < ApplicationController
  before_action :authenticate_user!

  # 締切日が今日でプロジェクトの依存関係は問わないタスク一覧
  def index
    @tasks = current_user.tasks.where("deadline = ?", get_today_date)
  end

  # 締切日とプロジェクトが未定のタスク一覧
  def inbox
    @tasks = current_user.tasks.where(deadline: nil)
  end

  # 締切日が今日以外で、プロジェクトの依存関係は問わないタスク一覧
  def future
  end

  private

  # 本日の日付を取得
  def get_today_date
    today = Date.current.strftime('%Y/%m/%d')
  end
end
