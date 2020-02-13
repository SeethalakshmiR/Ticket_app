# frozen_string_literal: true

# to get user details
class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :confirm_movie_name
      t.string :confirm_theatre_name
      t.integer :no_of_seats
      t.string :show_time

      t.timestamps
    end
  end
end
