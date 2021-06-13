class TasksController < ApplicationController
  before_action :authenticate_user!before_action :authenticate_user!

  def new
  end

  def create
  end

  # タスクの詳細画面であるが、変更フォームやコメントの一覧、コメントフォームが存在する
  def edit
  end

  def update
  end

  def destroy
  end
end
