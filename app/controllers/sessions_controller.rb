class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_address: params[:email])
    verified = User.authenticate(params[:email], params[:password])
    if user && verified
      session[:user_id] = verified.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Credentials not valid - try again"
      render 'new'
    end
  end

  def destroy
    user = User.find_by(email_address: params[:email])
    session.delete(:user_id)
    redirect_to login_path
  end
end
