class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to home_path
    else
      render :new
    end
  end

  # タスクの詳細画面であるが、変更フォームやコメントの一覧、コメントフォームが存在する
  def show
    @task = Task.find(params[:id])

    # コメント用のフォーム
    @comment = Comment.new

    # コメント一覧
    @comments = @task.comments
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)      
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to home_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :deadline, :priority, :detail)
  end
end
