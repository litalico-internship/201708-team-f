class CreateAdvisers < ActiveRecord::Migration[5.1]
  def change
    create_table :advisers do |t|
      t.string :name
      t.string :comment
      t.string :avator
      t.integer :min_age
      t.integer :max_age
      t.integer :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
