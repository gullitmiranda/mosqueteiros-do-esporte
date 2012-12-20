class HomeController < ApplicationController
  def index
    if session[:return_to].present? and session[:authentication].present?
      p 'Sim' + ('*' * 100)
      url = session[:return_to]
      session.delete(:return_to)
      session.delete(:authentication)
      redirect_to(url) and return
    else
      p 'Nao' + ('-' * 100)
    end

    @projects = Project.active.featured.ordered_by_date
  end
end
