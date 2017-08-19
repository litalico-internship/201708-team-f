class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :adviser_id
      t.timestamp :time
      t.string :body

      t.timestamps
    end
  end
end
