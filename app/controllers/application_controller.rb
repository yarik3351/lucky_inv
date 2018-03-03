class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :admin?


  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  #
  # def logged_in?
  #   current_user != nil
  # end

  def admin?
     current_user&.admin?
  end
end
