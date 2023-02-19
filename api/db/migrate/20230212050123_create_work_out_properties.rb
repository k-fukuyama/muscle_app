class CreateWorkOutProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :work_out_properties do |t|
      t.integer :rep, null: false
      t.integer :weight_type, null: false
      t.integer :interval, null: false
      t.integer :work_out_id, null: false

      t.timestamps
    end
  end
end
