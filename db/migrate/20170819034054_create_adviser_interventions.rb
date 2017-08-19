class CreateAdviserInterventions < ActiveRecord::Migration[5.1]
  def change
    create_table :adviser_interventions do |t|
      t.integer :adviser_id
      t.integer :intervention_id

      t.timestamps
    end
  end
end
