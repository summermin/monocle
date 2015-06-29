class ProjectsController < ApplicationController
  before_action :load_current_user, only: [:index, :new]

  def index
    @projects = @user.projects
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
    params.require(:project).permit(:name, :description, :start_date, :end_date, :user_id, :project_type)
  end

  def load_current_user
    @user = current_user
  end

end
