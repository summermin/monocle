class GoalsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    @goal = Goal.create(goal_params)
    @user = User.find(params[:user_id])
    redirect_to user_goal_path(@user, @goal), notice: "Goal created successfully"
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :start_date, :end_date, :user_id)
  end

end
