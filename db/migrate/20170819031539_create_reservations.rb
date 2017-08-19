class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :adviser, foreign_key: true
      t.timestamp :start_time
      t.integer :status

      t.timestamps
    end
  end
end
