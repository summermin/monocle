class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
  end

  def create
    @project = Project.create(project_params)
    redirect_to projects_path, notice: "Project created successfully"
  end

  def update
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :project_type, :has_check_ins).merge(
      user_id: current_user.try!(:id)
    )
  end

end
