class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.float :protein, null: false, default: 0.0
      t.float :fat, null: false, default: 0.0
      t.float :carbohydrate, null: false, default: 0.0
      t.float :calorie, null: false, default: 0.0

      t.timestamps
    end
  end
end
