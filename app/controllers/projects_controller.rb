class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.where(posted: true)
    @projects = if params[:search]
                  @projects.search(params[:search]).order('created_at DESC')
                else
                  @projects.order('created_at DESC')
                end
  end

  def show
    @pool = Pool.new
    @log = @project.logs.new
    @logs = @project.logs.order('created_at DESC')
  end

  def create
    @project = current_user.projects.new(create_project_params)
    return redirect_back(fallback_location: :fallback_location) unless @project.save
    redirect_to @project, notice: 'Project was successfully created.'
    # redirect_to project_path(@project.title), notice: 'Project was successfully created.'
  end

  def update
    return redirect_back(fallback_location: :fallback_location) unless @project.update(update_project_params)
    redirect_to @project, notice: 'Project was successfully updated.'
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
    # @project = Project.find_by_title(params[:id])
  end

  def create_project_params
    params.require(:project).permit(:title, :posted)
  end

  def update_project_params
    params.require(:project).permit(:title, :about, :context, :significance, :goals, :posted)
  end
end
