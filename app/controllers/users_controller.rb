class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
    end

    def show
      id = params[:id]
      user = User.find(id)
      render plain: user.to_pleasant_string
    end

    def create
      name = params[:name]
      email = params[:email]
      password = params[:password]
      new_user = User.create!(
        name: name,
        email: email,
        password: password
      )
      response_text = "New user #{name} created with id #{new_user.id}"
      render plain: response_text
    end
    
    def login
        email = params[:email]
        password = params[:password]
        user = User.where(email:email,password:password).first
        response_text = user == nil ? false : true
        render plain: response_text
    end

  end