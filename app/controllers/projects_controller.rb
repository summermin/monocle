class ProjectsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @project = Project.create(project_params)
    @user = User.find(params[:user_id])
    redirect_to user_project_path(@user, @project), notice: "Project created successfully"
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :user_id)
  end

end
