class Player::PasswordController < ApplicationController
  def edit
    @player = current_player
  end

  def update
    player = params[:player]
    password, confirmation = player[:password], player[:password_confirmation]

    if current_player.change_password(password, confirmation)
      redirect_to sciezka_po_aktualizacji, notice: "You've updated your password"
    else
      render :edit
    end
  end
end