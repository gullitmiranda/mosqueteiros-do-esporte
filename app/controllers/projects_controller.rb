class ProjectsController < ApplicationController
  def index
    @projects = Project.published.ordered_by_date.page(params[:page]).per(20)
  end

  def show
    @project = Project.published.find(params[:id])
    # TODO: update amount
    @payment = Payment.new(project: @project, amount: 60)
  end
end
