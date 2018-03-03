class SessionsController < ApplicationController

  def create

    @saved_email = params[:session][:email]
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # Log the user in and redirect to the invoices page.
      log_in @user
      respond_to do |format|
        format.html { @user if @user}
      end
      redirect_to root_path
    else
      # Create an error message.
      @saved_email = params[:session][:email]
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
    end
  # def create
  #   @user = User.find_by_email(params[:email])
  #
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to root_path
  #   else
  #     flash[:danger] = 'Wrong email or password.'
  #     redirect_to login_path
  #   end
  # end

  def login
  end



  def logout
    log_out if logged_in?
    flash[:notice] = 'Logged out!'
    redirect_to login_path
  end
end
