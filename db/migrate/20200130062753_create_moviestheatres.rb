# frozen_string_literal: true

# contains movie and theatre id
class CreateMoviestheatres < ActiveRecord::Migration[6.0]
  def change
    create_table :moviestheatres do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :theatre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
