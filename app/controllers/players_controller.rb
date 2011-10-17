class PlayersController < ApplicationController

  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
