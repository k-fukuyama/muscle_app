class CreateMuscles < ActiveRecord::Migration[6.1]
  def change
    create_table :muscles do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
