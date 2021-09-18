class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_id

  def ensure_user_logged_id
    unless current_user
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    @current_user = current_user_id ? user = User.find(current_user_id) : nil
  end
end
