# frozen_string_literal: true

class AddPriceToDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :details, :price, :integer
  end
end
