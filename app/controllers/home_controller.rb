class HomeController < ApplicationController
  def index
    if session[:return_to].present?
      url = session[:return_to]
      session.delete(:return_to)
      redirect_to(url) and return
    end

    @projects = Project.active.featured.ordered_by_date
  end
end
