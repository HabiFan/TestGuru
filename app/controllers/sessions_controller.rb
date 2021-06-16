class SessionsController < ApplicationController
  
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(cookies[:return_to_url] || tests_path)
    else
      flash.now[:alert] = flash_status_text(:alert)
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:return_to_url)
    @current_user = nil
    redirect_to login_path
  end
end
