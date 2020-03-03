# frozen_string_literal: true

class AddPriceToTheatreshows < ActiveRecord::Migration[6.0]
  def change
    add_column :theatreshows, :price, :integer
  end
end
