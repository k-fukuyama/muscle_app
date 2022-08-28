class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :memo
      t.float :calorie, null: false, default: 0.0
      t.float :protein, null: false, default: 0.0
      t.float :fat, null: false, default: 0.0
      t.float :carbohydrate, null: false, default: 0.0

      t.timestamps
    end
  end
end
