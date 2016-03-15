class GamesController < ApplicationController 
  before_action :get_game, only: [:show, :edit, :update, :destroy]
  before_action :get_user, except: [:index, :show]
  def get_game
    @game = Game.find(params[:id])
  end
  def get_user
      @user = User.find(params[:user_id])
  end
  
  def update_properties
    if @user == current_user
      @params = params[:properties]
      @params.each_pair do |game_property_id, property| 
      game_property = GameProperty.find(game_property_id)
      user_game_property = UserGameProperty.where(:game_property_id => game_property.id, :user_id => @user.id).first
        if user_game_property.present? 
          user_game_property.update_attribute(:value,property[:name]) 
        else
          new_property = UserGameProperty.new(:value => property[:name], :game_property_id => game_property.id, :user_id => @user.id)
          new_property.save
        end 
      end
    end
    redirect_to user_games_path, notice: "Changes has been saved"
  end

  def index
    if params[:user_id].present?
      paginate=10
      @user = User.find(params[:user_id])
      @games = @user.games.games_by_name.paginate(:page => params[:page], :per_page => paginate)
      render 'index'
    else
      paginate=20
      if params[:search]
        @games = Game.search(params[:search]).games_by_name.paginate(:page => params[:page], :per_page => paginate)
      else
        @games = Game.all.games_by_name.paginate(:page => params[:page], :per_page => paginate)
      end
      render 'indexpub'
    end
  end

  def show
    if params[:user_id].present?
       @user = User.find(params[:user_id])
        usergame = UserGame.where(:game_id => @game.id, :user_id => @user.id)
      if usergame.present? 
        @properties = UserGameProperty.joins(:game_property).where(:user_id => @user.id, :game_properties => {:game_id => @game.id})
      else
        redirect_to user_games_path
      end
      render 'show'
    else
      render 'showpub'
    end

  end

  def new
    if @user == current_user
      @games = Game.where.not(:id => @user.games.map(&:id))
      @game = UserGame.new
    else
      redirect_to user_games_path, alert: "You cant add games for other players"
    end
  end

  def edit
    if @user == current_user
      usergame = UserGame.where(:game_id => @game.id, :user_id => @user.id)
      if usergame.present? 
        @properties = @game.game_properties
        @closedvalues = ClosedValue.joins(:game_property).where(:game_properties => {:game_id => @game.id})
      else
        redirect_to user_games_path, alert: "You need first add this game to your library" 
      end
    else
      redirect_to posts_path, alert: "You cant change properties of other players"
    end
  end

  def create
    #Check param from select list
    @game = Game.find(params[:game_id])
    @user.games << @game
    redirect_to edit_user_game_path(id: params[:game_id]), notice: 'Game was successfully added'
  end

  def update
  end

  def destroy
    if @user == current_user
     usergame = UserGame.where(:game_id => @game.id, :user_id => @user.id).first
     usergame.destroy
     properties = UserGameProperty.joins(:game_property).where(:user_id => @user.id, :game_properties => {:game_id => @game.id}).destroy_all

     redirect_to user_games_path, notice: 'Game was successfully deleted from your library'
    end
  end

  def game_params
      params.require(:game).permit!
  end

  def permit!
  each_pair do |key, value|
    convert_hashes_to_parameters(key, value)
    self[key].permit! if self[key].respond_to? :permit!
  end

    @permitted = true
    self
  end
end