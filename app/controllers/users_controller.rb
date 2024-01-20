class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    # When a request is sent to /users/id Rails routes it to the show controller,
    # passing the id in the params hash
    # This @user variable is accessible in the users/show.html.erb view.
    @user = User.find(params[:id])
    # debugger # If code hits this line, debugger is started in the cli.
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end
end
