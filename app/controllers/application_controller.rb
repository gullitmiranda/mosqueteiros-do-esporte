class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :http_authenticate

  def http_authenticate
    if Rails.env.production?
      unless request.fullpath == "/google96e0988125391854.html"
        authenticate_or_request_with_http_basic do |user, pass|
         user == "mosqueteiros" and password == "dartagnan2012"
        end
      end
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
