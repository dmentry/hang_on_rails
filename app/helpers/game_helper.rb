module GameHelper
  def word_to_show(game)
    result = game.letters_to_guess.map do |letter|
        if letter.nil?
          '*'
        else
          letter
        end
      end

    result.join(' ')
  end

  def errors_to_show(game)
    game.errors_letters.join(', ')
  end
end
