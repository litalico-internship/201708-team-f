class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :adviser_id
      t.timestamp :start_time
      t.integer :status

      t.timestamps
    end
  end
end
