class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # All methods below are
  # considered private.
  private
  
  # Returns the currently logged in user.
  def current_user
  	@current_user ||= User.find(session[:userid]) if session[:userid]
  end

  # We check that the user is logged in
  # and if he isn't we redirect to login page.
  def require_authentication
  	if current_user.nil? then
  		redirect_to login_page_path
  	end
  end
end
