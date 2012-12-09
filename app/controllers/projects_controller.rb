class ProjectsController < ApplicationController
  def index
    @projects = Project.active.ordered_by_date.page(params[:page]).per(20)
  end

  def show
    @project = Project.active.find(params[:id])
    session[:return_to] = project_path(@project) unless current_user.present?
    @payment = Payment.new(project: @project, amount: 60)
  end
end
