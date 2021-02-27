class GamesController < ApplicationController
  def create
  end

  def show
  end

  def index
    @games = Game.sorted
  end

  def play
  end
end
