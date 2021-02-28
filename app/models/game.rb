class Game < ApplicationRecord
  TOTAL_ERRORS_ALLOWED = 7

  # attr_accessor :game_finished

  belongs_to :word

  scope :sorted, -> { order(created_at: :desc) }

  def errors_letters
    guesses - normalized_letters
  end

  def errors_made
    errors_letters.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result = letters.map do |letter|
      if guesses.include?(normalize_letters(letter))
        letter
      else
        nil
      end
    end
    return result
  end

  def over?
    return won? || lost?
  end

  def play!(letter)
    letter = letter.upcase
    letter = normalize_letters(letter)
    if !over? && !guesses.include?(letter)
      guesses << letter
    end
  end

  def won?
    return (normalized_letters - guesses).empty?
  end

  def lost?
    return errors_allowed == 0
  end

  def normalize_letters(letter)
    if letter == 'Ё'
      return 'Е'
    elsif letter == 'Й'
      return 'И'
    else
      return letter
    end
  end

  def normalized_letters
    letters.map { |letter| normalize_letters(letter) }
  end

  def letters
    word.letters
  end
end
