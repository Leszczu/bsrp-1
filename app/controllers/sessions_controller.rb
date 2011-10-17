class SessionsController < ApplicationController
  def new
  end
  
  def create
    player = Player.authenticate(params[:name], params[:password])
    if player
      session[:player_id] = player.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:player_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
