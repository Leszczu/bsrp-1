class PlayersController < ApplicationController

  def new
    @player = Player.new
  end
  
  def playershow
    @player = Player.find(params[:cached_slug])
  end
  
  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  def edit
    @player = current_player
  end
  
  def update
  
    @player = current_player
      if @player.update_attributes(params[:player])
        flash[:notice] = 'Zmiany zakończone powodzeniem.'
        redirect_to change_password_path
      else
        flash[:error] = "Napotkano problem #{@player.errors.inspect}"
        redirect_to change_password_path
    end
  end

end
