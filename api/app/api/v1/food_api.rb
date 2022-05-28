class FoodApi < Grape::API
  resources :foods do
    get do
      present ({foods: Services::FoodService.new.build_response(params)})
    end

    post do
      food = Food.new(food_params)

      isCreated = food.save ? true: false

      present ({isCreated: isCreated})
    end

    patch '' do
      food = Food.find_by(id: params[:food][:id])
      isUpdated = if food.nil?
                    status 404
                    false
                  else
                    food.update(food_params)
                  end

      present ({isUpdated: isUpdated})
    end

    delete do
      puts params
      food = Food.find_by(id: params[:food][:id])
      isDeleted = if food.nil?
                    status 404
                    false
                  else
                    food.destroy
                  end

      present ({isDeleted: isDeleted})
    end
  end
end

private 

def food_params
  {
    name: params[:food][:name], 
    protein: params[:food][:protein],
    fat: params[:food][:fat],
    carbohydrate: params[:food][:carbohydrate],
    calorie: params[:food][:calorie]
  }
end