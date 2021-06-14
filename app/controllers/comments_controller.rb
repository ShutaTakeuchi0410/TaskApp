class CommentsController < ApplicationController
  before_action :set_task

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @task
    else
      render 'tasks/show'
    end
  end

  private

  # 対象のタスクを取得する
  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :file)
  end
end
