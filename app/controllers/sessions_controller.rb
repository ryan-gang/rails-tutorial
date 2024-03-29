class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # if user&.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        (params[:session][:remember_me] == "1") ? remember(@user) : forget(@user) # Place cookies / remove cookies
        # redirect_to user_url(@user) # equivalent to user_url(user)
        redirect_back_or @user # Forwards to URL user wanted to, before being asked to log in
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
