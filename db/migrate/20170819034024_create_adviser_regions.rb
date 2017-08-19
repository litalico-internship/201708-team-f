class CreateAdviserRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :adviser_regions do |t|
      t.integer :adviser_id
      t.integer :region_id

      t.timestamps
    end
  end
end
