class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :user_id, foreign_key: true
      t.integer :adviser_id, foreign_key: true
      t.integer :rate
      t.string :comment

      t.timestamps
    end
  end
end
