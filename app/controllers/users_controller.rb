class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_id

  def index
    render "new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: (params[:password]),
    )
    if !new_user.save
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to users_path
    else
      flash[:info] = "Congrats! successfully signed-up, please sign-in to continue!"
      redirect_to new_sessions_path
    end
  end
end
