class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.text :guesses, array:true, default: []
      t.references :word, null: false, foreign_key: true

      t.timestamps
    end
  end
end
