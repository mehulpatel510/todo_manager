class SessionsController < ApplicationController
    def new

    end
    def create
        user = User.find_by(email: params[:email])
        if user && user.authernticate(params[:password])
            render plain "Success to login"
        else
            render plain "Fail to login"
        end
    end
end