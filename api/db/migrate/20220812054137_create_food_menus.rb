class CreateFoodMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :food_menus do |t|
      t.integer :menu_id, null: false
      t.integer :food_id, null: false

      t.timestamps
    end
  end
end
