class PlayersController < ApplicationController

  def new_1
    if request.post?
      session['register'] = 1
    end
  end

  def new_2
    @questions = Question.limit(10)
    session['register'] = 2
    #@questioncount = rand(@question.count)
    # jeśli wszystkie odpowiedzi będą poprawne, to ustawiaj sesję na wartość '2'
  end

  def new_3

    bad_one = []
    if request.post?
      bad_one = []
      params[:quiz].each do |k,v|
        question = Question.find(k)
        answer = question.answers.find(v[:answer])
        if answer.correct.to_i == 0
          bad_one << question.question
        end
      end
    end
    
      if bad_one.empty?
        
        flash[:notice] = "Quiz został poprawnie rozwiązany"
        session['register'] = 3
      else 
        flash[:error] = "Quiz został błędnie rozwiązany"
        redirect_to register_2_path
      end
      
    else
    @player = Player.new
    
    #if session['register'] != 2
    #  redirect_to register_2_path
    #else
  #end
  end
  
  def new
    redirect_to register_1_path
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
