class CreateCommunicatables < ActiveRecord::Migration[5.1]
  def change
    create_table :communicatables do |t|
      t.string :name

      t.timestamps
    end
  end
end
