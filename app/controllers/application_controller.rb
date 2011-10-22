class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_player
  
  private
  
  def current_player
    @current_player ||= Player.find(session[:player_id]) if session[:player_id]
  end
  
  def log_in
    if !current_player
      redirect_to root_path
      false
    else
      true
    end
  end
  
end
