class ProjectsController < ApplicationController
  def index
    # TODO: atualizar número de items por página
    @projects = Project.published.ordered_by_date.page(params[:page]).per(2)
  end

  def show
    @project = Project.published.find(params[:id])
  end
end
