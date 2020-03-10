# frozen_string_literal: true

# add movie theatre id to detail
class AddMoviesTheatreIdToDetails < ActiveRecord::Migration[6.0]
  def change
    add_reference :details, :moviestheatre, null: false, foreign_key: true
  end
end
