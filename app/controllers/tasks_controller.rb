class TasksController < ApplicationController

  # タスクの詳細画面であるが、変更フォームやコメントの一覧、コメントフォームが存在する
  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
    if @task.update(task_params)      
      redirect_to @task, notice: 'タスク内容を変更しました'
    else
      @comment = Comment.new
      @comments = @task.comments  
      render :show
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to home_path, notice: 'タスクを一件削除しました'
  end

  # タスクの達成、未達成のステータスを変更する(Ajax)
  def toggle
    @task = Task.find(params[:id])
    
    # タスクのdoneの値をひっくり返す
    @task.status = !@task.status
    
    # 空の場合は完了日時をカラムに追加し、存在する場合はnilにする(グラフ表示のため)
    if @task.done_date.present?
      @task.done_date = nil
    else
      @task.done_date = Date.current
    end

    @task.save
  end

  private

  def task_params
    params.require(:task).permit(:title, :deadline, :priority, :detail, :project_id, { :tag_ids=> [] })
  end
end
