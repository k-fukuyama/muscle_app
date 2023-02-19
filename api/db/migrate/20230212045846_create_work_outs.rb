class CreateWorkOuts < ActiveRecord::Migration[6.1]
  def change
    create_table :work_outs do |t|
      t.string :name, null: false
      t.integer :part, null: false
      t.integer :muscle_id, null: false

      t.timestamps
    end
  end
end
