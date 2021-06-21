class HomeController < ApplicationController

  # 締切日が今日でプロジェクトの依存関係は問わないタスク一覧
  def index
    # 優先度が高い順(締め切りは今日だから)
    # 今日のタスク
    @tasks = current_user.tasks.where("deadline = ?", get_today_date).order(priority: "ASC")

    # 未完了のタスク
    # デフォルトの並び替えは優先度が高い順
    # 並び替え用の分岐(デフォルト：締め切り日が今日に近い順)
    if params[:sort_type] == 'priority'
      @value = 'priority'
      @expired_tasks = current_user.tasks.where("deadline < ?", get_today_date).order(priority: "ASC")
    else
      @value = 'deadline'
      @expired_tasks = current_user.tasks.where("deadline < ?", get_today_date).order(deadline: "ASC")
    end
  end

  # 締切日とプロジェクトが未定のタスク一覧
  def inbox
      @tasks = current_user.tasks.where(deadline: nil).where(status: false).order(priority: "ASC")
  end

  # 締切日が今日以外で、プロジェクトの依存関係は問わないタスク一覧
  # 【問題】大量のSQLを実行している可能性が高い
  def future
    # 並び替え用の分岐(デフォルト：締め切り日が近い順)
    if params[:sort_type] == 'priority'
      @value = 'priority'
      @tasks = current_user.tasks.where("deadline > ?", get_today_date).order(priority: "ASC")
    else
      @value = 'deadline'
      @tasks = current_user.tasks.where("deadline > ?", get_today_date).order(deadline: "ASC")
    end
  end

  # タスクの達成、未達成のステータスを変更する(Ajax)
  def toggle
    # render nothing: true
    @task = Task.find(params[:id])
    # タスクのdoneの値をひっくり返す
    # @task.status = !@task.status
    @task.status = !@task.status
    @task.save
  end

  # 達成済みのタスクを一覧表示
  def done
    @tasks = current_user.tasks.where(status: true)
  end

  private

  # 本日の日付を取得
  def get_today_date
    today = Date.current.strftime('%Y/%m/%d')
  end
end
