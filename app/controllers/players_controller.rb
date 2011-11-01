class PlayersController < ApplicationController

  def new
    @player = Player.new
  end
  
  def playershow
    @player = Player.find(params[:cached_slug])
  end
    
  def show
    @player = Player.find(params[:cached_slug])
  end
  
  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to root_url, :notice => "Konto utworzone!"
    else
      flash[:error] = 'Wystąpił jakiś błąd, sprawdź i spróbuj ponownie'
      render "new"
    end
  end
  
  def change_password
    password, password_confirmation = params[:player][:password], params[:player][:password_confirmation]
    current_player.change_password(password, password_confirmation)
  end
  
  def edit
    @player = current_player
  end
  
  def update
  
    @player = current_player
      if @player.update_attributes(params[:player])
        flash[:notice] = 'Zmiany zakończone powodzeniem.'
        redirect_to cockpit_path
      else
        flash[:error] = "Napotkano problem #{@player.errors.inspect}"
        redirect_to cockpit_path
    end
  end

end
