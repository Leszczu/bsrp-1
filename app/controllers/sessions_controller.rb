﻿class SessionsController < ApplicationController
  def new
  end
  
  def create
    player = Player.authenticate(params[:name], params[:password])
    if player
      session[:player_id] = player.id
      redirect_to root_url#, :notice => "Zalogowany!"
    else
      flash[:error] = "Zła nazwa postaci, bądź hasło"
      render "new"
    end
  end
  
  def destroy
    session[:player_id] = nil
    redirect_to root_url#, :notice => "Wylogowany pomyślnie!"
  end

end
