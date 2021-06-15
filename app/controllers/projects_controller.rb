class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
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

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
