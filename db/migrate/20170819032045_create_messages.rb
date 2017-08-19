class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :adviser, foreign_key: true
      t.timestamp :time
      t.string :body

      t.timestamps
    end
  end
end
