module Services
  class MenuService
    def create_menu!(foods, menu_name, menu_memo)
      menu = Menu.new(name: menu_name, memo: menu_memo)
      now = Time.zone.now

      ActiveRecord::Base.transaction do
        menu.save!

        food_menu = foods.map do |food|
          FoodMenu.new(menu_id: menu.id, food_id: food.id, created_at: now, updated_at: now).attributes
        end

        FoodMenu.insert_all!(food_menu)
        menu.save_and_calculate_alimentation!
      end
    end

    def update_menu!(params)
      menu = Menu.find(params[:menu][:menu_id])
      menu.name = params[:menu][:name]
      register_target_food_ids = params[:foods].select{|food| !food[:registered]}.map{|register_target_food| register_target_food[:id]}
      now = Time.zone.now
      foods = Food.where(id: register_target_food_ids)
      food_menus = foods.map do |food|
        food.food_menus.build(menu_id: menu.id, created_at: now, updated_at: now).attributes
      end

      ActiveRecord::Base.transaction do
        FoodMenu.insert_all!(food_menus)
        menu.save_and_calculate_alimentation!
      end
    end
  end
end