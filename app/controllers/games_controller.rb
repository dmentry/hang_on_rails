class GamesController < ApplicationController
  def create
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.sorted
  end

  def play
  end
end
