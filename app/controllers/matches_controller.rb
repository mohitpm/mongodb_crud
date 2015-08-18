class MatchesController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @matches = @game.matches
  end

  def show
    @game = Game.find(params[:game_id])
    @match = @game.matches.find(params[:id])
  end

  def new
    @game = Game.find(params[:game_id])
    @match = @game.matches.build
  end

  def create
    @game = Game.find(params[:game_id])
    @match = @game.matches.build(allow_params)
    if @match.save
      redirect_to game_matches_path(@game.id)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:game_id])
    @match = @game.matches.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @match = @game.matches.find(params[:id])
    if @match.update_attributes(allow_params)
      redirect_to game_matches_path(@game.id)
    else
      render :new
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @match = @game.matches.find(params[:id])
    @match.destroy
    redirect_to game_matches_path(@game.id)
  end

  def allow_params
    params.require(:match).permit(:name, :venue, :played_on)
  end

end
