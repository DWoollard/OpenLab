class CategoriesProjectsController < ApplicationController
  before_action :set_project

  def create
    @category_project = CategoriesProject.new(category_project_params)
    @category_project.project = @project
    return redirect_to @project unless @category_project.save
    redirect_to @project, notice: "category successfully created"
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def category_project_params
    params.require(:categories_project).permit(:category_id)
  end
end
