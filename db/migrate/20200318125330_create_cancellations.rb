class CreateCancellations < ActiveRecord::Migration[6.0]
  def change
    create_table :cancellations do |t|
      t.string :ticket_id

      t.timestamps
    end
  end
end
