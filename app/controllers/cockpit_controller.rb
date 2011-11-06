class CockpitController < ApplicationController

  before_filter :log_in?

  layout 'cockpit'

  def index
  end

  def biography
  end

  def profile
  end

  def skins
    @player = current_player
    @skin = params[:skin]
  end

  def change_password
    @player = current_player
  end

  def avatar
    @player = current_player
  end

  def gallery
  end

  def vehicles
  end

  def logs
  end

  def online
  end

  def find_player
  end

end