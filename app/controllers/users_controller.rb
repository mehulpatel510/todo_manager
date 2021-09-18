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
      redirect_to
    else
      redirect_to "/"
    end
  end
end
