class Game < ApplicationRecord
  belongs_to :word

  scope :sorted, -> { order(created_at: :desc) }
end
