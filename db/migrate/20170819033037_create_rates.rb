class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :adviser, foreign_key: true
      t.int :rate
      t.string :comment

      t.timestamps
    end
  end
end
