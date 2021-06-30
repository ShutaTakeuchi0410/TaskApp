class TasksController < ApplicationController
  # privateでメソッドを作成している
  before_action :set_task, only: %i[show update destroy toggle]

  # タスクの詳細画面であるが、変更フォームやコメントの一覧、コメントフォームが存在する
  def show
    # taskに紐づく中間テーブルの生成(これ無くても動いた)
    # @task.task_tags.buildx

    # コメント用のフォーム
    @comment = Comment.new

    # コメント一覧
    @comments = @task.comments
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    # if @task.save
    #   redirect_to home_path
    # else
    #   render :new
    # end

    respond_to do |format|
      if @task.save
        format.html { redirect_to new_task_path, notice: 'タスクを一件追加しました' }
        format.json { render :show, status: :created, location: @task }
        # 追加
        # format.js { @status = "success" }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        # 追加
        # format.js { @status = "fail" }
         format.js { render :new }
      end
    end
    
  end

  def update
    if @task.update(task_params)      
      redirect_to @task, notice: 'タスク内容を変更しました'
    else
      @comment = Comment.new
      @comments = @task.comments  
      render :show
    end
  end

  def destroy
    @task.destroy
    redirect_to home_path, notice: 'タスクを一件削除しました'
  end

  # タスクの達成、未達成のステータスを変更する(Ajax)
  def toggle
    @task.toggle!
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :deadline,
      :priority,
      :detail,
      :project_id,
      { tag_ids: [] }
    )
  end

  def set_task
    # @task = Task.find(params[:id]) #=> SELECT * FROM tasks WHERE id = xxx;

    # ブログ: 下書き、公開という状態(is_published)がある
    # @blog  = Blog.find(params[:id])
    # @blog  = Blog.published.find(params[:id])

    # # Scope
    # scope :published, -> { where(is_published: true) }
    # # 

    # @tasks = find(params[:id])とすると、urlを変更した時に他の人のタスクも見れてしまう。
    @task = current_user.tasks.find(params[:id]) #=> SELECT * FROM tasks WHERE id = xxx and user_id = ログインしているユーザーID;

    # @tasks = Task.all
    # @tasks = current_user.tasks
  end
end
