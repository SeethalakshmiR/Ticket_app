# frozen_string_literal: true

# contains list of theatres
class CreateTheatres < ActiveRecord::Migration[6.0]
  def change
    create_table :theatres do |t|
      t.string :name

      t.timestamps
    end
  end
end
