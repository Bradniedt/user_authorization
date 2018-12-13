class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_address: params[:email])
    if user && User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "Credentials not valid - try again"
      render 'new'
    end
  end

  def destroy

  end
end
