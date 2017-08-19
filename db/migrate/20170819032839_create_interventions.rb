class CreateInterventions < ActiveRecord::Migration[5.1]
  def change
    create_table :interventions do |t|
      t.string :name

      t.timestamps
    end
  end
end
