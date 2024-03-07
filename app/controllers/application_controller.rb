class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end




  def logged_in?
   !!current_user
  end

  def authenticate_user!
    unless logged_in?
     render json: {
      status: 401
     }
   end
 end
end