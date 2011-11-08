class PlayersController < ApplicationController

  def new
    @player = Player.new
  end
  
  def playershow
    @player = Player.find(params[:cached_slug])
  end
    
  def show
    @player = Player.find(params[:cached_slug])
    @comments = Comment.find_by_sql("SELECT * FROM comments where player_id = #{@player.id} LIMIT 5")
  end

  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to root_url, :notice => "Konto utworzone!"
    else
      flash[:error] = "Napotkano problem #{@player.errors.inspect}"
      render "new"
    end
  end
  
  #def change_password
  #  password, password_confirmation = params[:player][:password], params[:player][:password_confirmation]
  #  current_player.change_password(password, password_confirmation)
  #end
  
  def edit
    @player = current_player
  end
  
  def update
    @player = current_player
      if @player.update_attributes(params[:player])
        respond_to do |format|
          flash[:notice] = "Zmiany zostały zapisane pomyślnie!"
          format.html { redirect_to(:back) }
          format.js
        end
      else
        flash[:error] = "Napotkano problem #{@player.errors.inspect}"
        redirect_to(:back)
    end
  end

end
