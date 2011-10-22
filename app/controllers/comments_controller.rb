class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment])
      if @comment.save
        flash[:notice] = 'Komentarz umieszczony sukcesywnie'
        redirect_to show_path(@comment.news) + '#comments'
      else
        flash[:error] = 'error'
      end
  end

end
