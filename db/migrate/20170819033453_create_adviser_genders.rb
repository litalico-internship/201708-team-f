class CreateAdviserGenders < ActiveRecord::Migration[5.1]
  def change
    create_table :adviser_genders do |t|
      t.integer :adviser_id
      t.integer :gender_id

      t.timestamps
    end
  end
end
