class AddMorningShowCountToMoviestheatre < ActiveRecord::Migration[6.0]
  def change
    add_column :moviestheatres, :morning_show_count, :integer
  end
end
