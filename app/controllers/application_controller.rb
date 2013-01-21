class ApplicationController < ActionController::Base
  protect_from_forgery

  # http_basic_authenticate_with :name => "mosqueteiros", :password => "dartagnan2012"

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
