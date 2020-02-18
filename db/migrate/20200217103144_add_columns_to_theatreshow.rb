class AddColumnsToTheatreshow < ActiveRecord::Migration[6.0]
  def change
    add_column :theatreshows, :seat_count, :integer
  end
end
