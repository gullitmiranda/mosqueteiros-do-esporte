class HomeController < ApplicationController
  def index
    @projects = Project.published.featured.ordered_by_date
  end
end
