class HomeController < ApplicationController
  def index
    @projects = Project.active.featured.ordered_by_date
  end
end
