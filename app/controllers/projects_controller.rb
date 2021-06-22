class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])

    # 並び替え
    if params[:sort_type] == 'priority'
      @value = 'priority'
      @tasks = @project.tasks.where(status: false).order(priority: "ASC")
    else
      @value = 'deadline'
      @tasks = @project.tasks.where(status: false).order(deadline: "ASC")
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    # if @project.save
    #   redirect_to home_path
    # else
    #   render :new

    respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @task }
        # 追加
        format.js { @status = "success" }
      else
        format.html { render :new }
        # format.json { render json: @task.errors, status: :unprocessable_entity }
        # 追加
        format.js { @status = "fail" }
      end
    end
  end

  def destroy
    project = Project.find(params[:id])

    # taskのproject_idをnilにする
    tasks = Task.where(project_id: project.id)
    tasks.each do |task|
      task.project_id = nil
      task.save
    end

    project.destroy
    redirect_to home_path
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
