class RemoveColumnsFromMoviestheatres < ActiveRecord::Migration[6.0]
  def change

    remove_column :moviestheatres, :morning_show_count, :integer

    remove_column :moviestheatres, :evening_show_count, :integer

    remove_column :moviestheatres, :night_show_count, :integer

    remove_column :moviestheatres, :matinee_show_count, :integer
  end
end
