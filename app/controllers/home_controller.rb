class HomeController < ApplicationController
  def faq
  end

  def last_changes
  end

  def organizations
    @police = Player.find_by_sql("SELECT * FROM players where organization = 1")
    @fire = Player.find_by_sql("SELECT * FROM players where organization = 2")
    @government = Player.find_by_sql("SELECT * FROM players where organization = 3")
    @bsn = Player.find_by_sql("SELECT * FROM players where organization = 4")
  end

  def admins
  end

  def contact
  end

end
