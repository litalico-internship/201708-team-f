class CreateAdviserSpans < ActiveRecord::Migration[5.1]
  def change
    create_table :adviser_spans do |t|
      t.integer :adviser_id
      t.integer :span_id

      t.timestamps
    end
  end
end
