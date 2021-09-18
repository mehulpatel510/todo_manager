class SessionsController < ApplicationController
    skip_before_action :ensure_user_logged_id
    
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            redirect_to home_path
        else
            flash[:error] = "Invalid username or password!"
            redirect_to new_sessions_path
        end
    end


    def destroy
        session[:current_user_id] = nil
        @current_user = nil
        redirect_to home_path
    end
end