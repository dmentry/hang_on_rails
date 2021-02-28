class Word < ApplicationRecord
  has_many :games, dependent: :destroy

  validates :text, presence: true, uniqueness: true, format: { with: /\A[[:word:]]+\z/ }

  def letters
    text.chars
  end
end
