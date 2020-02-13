# frozen_string_literal: true

# add new four columns to table
class AddColumnsToMoviestheatre < ActiveRecord::Migration[6.0]
  def change
    add_column :moviestheatres, :morning_show_count, :integer
    add_column :moviestheatres, :matinee_show_count, :integer
    add_column :moviestheatres, :evening_show_count, :integer
    add_column :moviestheatres, :night_show_count, :integer
  end
end
