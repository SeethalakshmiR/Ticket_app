# frozen_string_literal: true

class CreateTheatreshows < ActiveRecord::Migration[6.0]
  def change
    create_table :theatreshows do |t|
      t.string :name
      t.time :time
      t.references :theatre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
