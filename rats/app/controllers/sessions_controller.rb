class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to home_path
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:current_role] = user.roles.first.name.to_sym
      redirect_to home_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:current_role] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def set_current_role
    if current_user
      session[:current_role] = (params[:role] && params[:role].to_sym) || session[:current_role]
      redirect_to home_path, notice: "Currently viewing as a #{current_role}"
    end
  end

  def home

  end

end
