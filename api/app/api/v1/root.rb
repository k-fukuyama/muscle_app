class Root < Grape::API
  version 'v1', using: :path
  format :json
  content_type :json, 'application/json'
  auth :grape_devise_token_auth, resource_class: :user
  helpers GrapeDeviseTokenAuth::AuthHelpers

  mount MachineApi
  mount MuscleApi
  mount FoodApi
  mount TipApi
  mount MenuApi
  mount WorkOutApi
end