class CreateMuscleMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :muscle_machines do |t|
      t.integer :muscle_id, null: false
      t.integer :machine_id, null: false

      t.timestamps
    end
  end
end
