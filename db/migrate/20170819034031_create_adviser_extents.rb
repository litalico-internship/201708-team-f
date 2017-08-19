class CreateAdviserExtents < ActiveRecord::Migration[5.1]
  def change
    create_table :adviser_extents do |t|
      t.integer :adviser_id
      t.integer :extent_id

      t.timestamps
    end
  end
end
