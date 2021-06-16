class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      redirect_to home_path
    else
      render :new
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
