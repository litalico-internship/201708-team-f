class CreateSpans < ActiveRecord::Migration[5.1]
  def change
    create_table :spans do |t|
      t.string :name

      t.timestamps
    end
  end
end
