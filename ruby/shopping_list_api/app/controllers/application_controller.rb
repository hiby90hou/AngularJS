class ApplicationController < ActionController::API
  def current_user
        @current_user ||= User.find(session[:email]) if session[:email]
    end
     helper_method :current_user
end
