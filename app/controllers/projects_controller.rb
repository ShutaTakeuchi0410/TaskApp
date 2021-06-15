class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to home_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
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
