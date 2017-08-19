class CreateAdviserCommunicatables < ActiveRecord::Migration[5.1]
  def change
    create_table :adviser_communicatables do |t|
      t.integer :adviser_id
      t.integer :communicatable_id

      t.timestamps
    end
  end
end
