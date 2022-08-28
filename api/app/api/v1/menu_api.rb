class MenuApi < Grape::API
  resources :menus do
    get do
      present ({menus: Menu.all})
    end

    get '/recommend' do
      present ({recommend: Menu.all.sample})
    end

    post do
      food_ids = params[:foods].map{|menu_food| menu_food[:id]}
      return unless food_ids.present?

      Services::MenuService.new.create_menu!(Food.where(id: food_ids), params[:name], params[:memo])

      present ({isCreated: true})
    end

    patch do
      Services::MenuService.new.update_menu!(params)

      present ({isUpdated: true})
    end

    delete '/:id'do
      puts params
      menu = Menu.find(params[:id])

      menu.destroy!

      present ({isDeleted: true})
    end

    delete '/:menu_id/food/:food_id' do
      menu = Menu.find(params[:menu_id])

      delete_target_food_menu = menu.food_menus.find_by(food_id: params[:food_id])
      delete_target_food_menu.destroy!
      menu.save_and_calculate_alimentation!

      present ({isDeleted: true})
    end

    get '/:menu_id' do
      menu = Menu.includes(:foods).find(params[:menu_id])

      registered_foods = menu.foods.map(&:attributes)

      registered_foods.each do |food|
        food[:registered] = true
      end

      present ({menu: menu, registered_foods: registered_foods})
    end
  end
end