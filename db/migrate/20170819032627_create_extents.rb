class CreateExtents < ActiveRecord::Migration[5.1]
  def change
    create_table :extents do |t|
      t.string :name

      t.timestamps
    end
  end
end
