class UsersController < ApplicationController

  def show
    @project = current_user.projects.new
    @pool = Pool.new
    @projects = current_user.projects
    @logs = current_user.logs
  end

  def create
    create_user user_params
    return redirect_to root_path unless @user.save
    redirect_to root_path, notice: 'Created user'
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
