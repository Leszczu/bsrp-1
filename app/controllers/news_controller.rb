class NewsController < ApplicationController
  def index
    @news = News.all.paginate(:per_page => 3, :page => params[:page], :order => 'created_at DESC')
  end

  def show
    @news = News.find(params[:cached_slug])
    if current_player
      @comment = Comment.new(:news_id => @news.id, :player_id => current_player.id)
    end
  end


end
