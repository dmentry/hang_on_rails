class GamesController < ApplicationController
  def create
    word = Word.order('RANDOM()').first

    game = word.games.create

    redirect_to game
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.sorted_all
    @games_last_10 = Game.sorted_last_10
  end

  def play
    game = Game.find(params[:id])
    game.play!(params[:letter])
    game.save

    # работаем с помощью хэпера respond_to с форматом json
    respond_to do |format|
      format.json do
        render json: {
          # значение json будет куском html, создается методом render_to_string (рендерится в строку)
          current: render_to_string(partial: 'games/current', locals: { game: game }, formats: [:html])
        }
      end
    end
  end
end
