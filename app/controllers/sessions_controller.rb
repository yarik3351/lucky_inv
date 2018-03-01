class SessionsController < ApplicationController

  def login
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = 'Wrong email or password.'
      redirect_to login_path
    end
  end

  def logout
    reset_session
    flash[:notice] = 'Logged out!'
        redirect_to login_path
  end
end
