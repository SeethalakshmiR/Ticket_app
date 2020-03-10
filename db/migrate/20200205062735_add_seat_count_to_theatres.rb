# frozen_string_literal: true

# add seat count to theatre
class AddSeatCountToTheatres < ActiveRecord::Migration[6.0]
  def change
    add_column :theatres, :seat_count, :integer
  end
end
