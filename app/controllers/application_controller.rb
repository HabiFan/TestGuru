class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?,
                :flash_status_text

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: flash_status_text(:alert)
    end  
    cookies[:return_to_url] = request.url
    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?    
  end

  def flash_status_text(status)
    case status
      when :alert then 'Are you a Guru? Verify your Email and Password please'
    end
  end
end
