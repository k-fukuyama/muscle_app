class Root < Grape::API
  version 'v1', using: :path
  format :json
  content_type :json, 'application/json'

  mount MachineApi
  mount MuscleApi
  mount FoodApi
  mount TipApi
end