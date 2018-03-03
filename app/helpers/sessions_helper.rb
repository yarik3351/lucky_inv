module SessionsHelper

  def flash_class(level)
    case level
      when :notice then 'notice'
      when :danger then 'danger'
    end
    level
  end

  def log_in(user)
    session[:user_id] = user.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
    @current_user = nil
  end
end
